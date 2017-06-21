defmodule Dota2API.Mapper.Match do
  @moduledoc """
  Match mapper.
  """

  alias Dota2API.Model.Match

  @get_match_url "http://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/v1"

  @doc """
  Get a match.

  ## Example

      iex> {:ok, match} = Dota2API.Mapper.Match.load(3241475535)
      iex> match.__struct__ == Dota2API.Model.Match
      true
  """
  def load(match_id, key \\ nil) do
    result = Dota2API.Request.load(
      @get_match_url, [match_id: match_id, key: key]
    )["result"]

    {:ok, Match.build_from(result)}
  end
end
