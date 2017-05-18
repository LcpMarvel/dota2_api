defmodule Dota2API.Mappers.Match do
  @moduledoc """
  Match mapper.
  """

  alias HTTPoison.Response
  alias Dota2API.Models.Match

  @get_match_url "http://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/v1"

  # Dota2API.Mappers.Match.load 3193331363
  # @spec load(integer | String.t) :: {:ok, Match.t}
  def load(match_id) do
    {:ok, %Response{body: body}} = Utils.Request.load(
      @get_match_url, [match_id: match_id]
    )

    result = Poison.decode!(body)["result"]

    {:ok, Match.build_from(result)}
  end
end
