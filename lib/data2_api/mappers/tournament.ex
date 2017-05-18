defmodule Dota2API.Mappers.Tournament do
  @moduledoc """
  Tournament mapper.
  """

  alias HTTPoison.Response

  @get_prize_pool_url "http://api.steampowered.com/IEconDOTA2_570/GetTournamentPrizePool/v1"

  @spec prize_pool(integer | nil) :: {:ok, integer, integer, integer}
  def prize_pool(league_id \\ nil) do
    {:ok, %Response{body: body}} = Utils.Request.load(@get_prize_pool_url, [league_id: league_id])

    result = Poison.decode!(body)["result"]

    {
      :ok,
      result["league_id"],
      result["status"],
      result["prize_pool"]
    }
  end
end
