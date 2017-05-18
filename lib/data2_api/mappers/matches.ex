defmodule Dota2API.Mappers.Matches do
  @moduledoc """
  Match mapper.
  """

  @type param :: {atom, String.t | integer}

  alias HTTPoison.Response
  alias Dota2API.Models.Match
  alias Dota2API.Enums.GameMode

  @get_matches_url "http://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/v1"

  @doc """
  Get all matches.

  ## Example

      iex> {:ok, _number_of_results, _total_results, _results_remaining, matches} = Dota2API.Mappers.Matches.load
      iex> List.first(matches).__struct__ == Dota2API.Models.Match
      true
  """
  @spec load([param]) :: {:ok, integer, integer, integer, [Match.t]} | {:error, String.t}
  def load(opts \\ []) do
    {:ok, %Response{body: body}} = Utils.Request.load(
      @get_matches_url, request_params(opts)
    )

    result = Poison.decode!(body)["result"]

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
      game_mode: GameMode.get(opts[:game_mode]),
      min_players: opts[:min_players],
      account_id: opts[:account_id],
      league_id: opts[:league_id],
      start_at_match_id: opts[:start_at_match_id],
      matches_requested: opts[:matches_requested],
      tournament_games_only: opts[:tournament_games_only]
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
