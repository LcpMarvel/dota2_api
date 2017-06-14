defmodule Dota2API.Mapper.PlayerSummaries do
  @moduledoc """
  Player summaries mapper.
  """

  alias Dota2API.SteamIdConversion

  alias Dota2API.Model.PlayerSummary

  @get_player_summaries_url "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/"

  @doc """
  Get player summaries.

  ## Example

      iex> {:ok, [player_summary | _]} = Dota2API.Mapper.PlayerSummaries.batch_load([275477134])
      iex> player_summary.__struct__ == Dota2API.Model.PlayerSummary
      true
  """
  @spec batch_load([SteamIdConversion.steam32], String.t | nil) :: [PlayerSummary.t]
  def batch_load(account_ids, key \\ nil) when is_list(account_ids) do
    steam64_ids =
      account_ids
        |> Enum.map(&SteamIdConversion.steam32_to_steam64/1)
        |> Enum.join(",")

    players_data = Dota2API.Request.load(
      @get_player_summaries_url, [steamids: steam64_ids, key: key]
    )["response"]["players"]

    {:ok, PlayerSummary.build_from(list: players_data)}
  end

  @doc """
  Get player summary.

  ## Example

      iex> {:ok, player_summary} = Dota2API.Mapper.PlayerSummaries.load(275477134)
      iex> player_summary.__struct__ == Dota2API.Model.PlayerSummary
      true
  """
  @spec load(SteamIdConversion.steam32, String.t | nil) :: PlayerSummary.t
  def load(account_id, key \\ nil) do
    {:ok, [player_summary]} = batch_load([account_id], key)

    {:ok, player_summary}
  end
end
