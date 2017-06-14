defmodule Dota2API.Mapper.Matches do
  @moduledoc """
  Match mapper.
  """

  @type param :: {atom, String.t | integer}

  alias Dota2API.Model.Match
  alias Dota2API.Enum.GameMode

  @get_matches_url "http://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/v1"

  @doc """
  Get all matches by heroes.

  ## Example

      iex> {:ok, heroes, _count} = Dota2API.Mapper.Heroes.load
      iex> [first_hero|_] = heroes
      iex> matches = Dota2API.Mapper.Matches.all_matches(275477134, hero_ids: [first_hero.id])
      iex> List.first(matches).__struct__ == Dota2API.Model.Match
      true
  """
  @spec all_matches(integer, hero_ids: [integer]) :: [Match.t]
  def all_matches(account_id, hero_ids: hero_ids) do
    load_by_hero_id = fn(hero_id) ->
      case load(account_id: account_id, hero_id: hero_id) do
        {:ok, _, _, _, match_digests} ->
          match_digests
        _ ->
          []
      end
    end

    hero_ids
      |> Enum.map(load_by_hero_id)
      |> List.flatten
  end

  @doc """
  Get all matches.

  ## Example

      iex> {:ok, _number_of_results, _total_results, _results_remaining, matches} = Dota2API.Mapper.Matches.load
      iex> List.first(matches).__struct__ == Dota2API.Model.Match
      true
  """
  @spec load([param]) :: {:ok, integer, integer, integer, [Match.t]} | {:error, String.t}
  def load(opts \\ []) do
    result = Dota2API.Request.load(
      @get_matches_url, request_params(opts)
    )["result"]

    case result["status"] do
      1 ->
        {
          :ok,
          result["num_results"],
          result["total_results"],
          result["results_remaining"],
          Match.build_digest_from(list: result["matches"])
        }
      15 ->
        {:error, result["statusDetail"]}
    end
  end

  @doc false
  @spec request_params([param]) :: [param]
  def request_params(opts) do
    params = [
      hero_id: opts[:hero_id],
      game_mode: GameMode.key(opts[:game_mode]),
      min_players: opts[:min_players],
      account_id: opts[:account_id],
      league_id: opts[:league_id],
      start_at_match_id: opts[:start_at_match_id],
      matches_requested: opts[:matches_requested],
      tournament_games_only: opts[:tournament_games_only],
      key: opts[:key]
    ] |> Enum.filter(fn({_, value}) -> value end)

    # skill ignored if an account is specified
    skill = opts[:skill]

    if is_nil(opts[:account_id]) && skill do
      params ++ [skill: skill]
    else
      params
    end
  end
end
