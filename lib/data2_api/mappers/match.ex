defmodule Dota2API.Mappers.Match do
  @moduledoc """
  Match mapper.
  """

  alias Dota2API.Models.Match

  @get_match_url "http://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/v1"

  # @spec load(integer | String.t) :: {:ok, Match.t}
  def load(match_id, key \\ nil) do
    result = Utils.Request.load(
      @get_match_url, [match_id: match_id, key: key]
    )["result"]

    {:ok, Match.build_from(result)}
  end
end
