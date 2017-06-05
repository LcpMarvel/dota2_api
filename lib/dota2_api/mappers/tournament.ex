defmodule Dota2API.Mappers.Tournament do
  @moduledoc """
  Tournament mapper.
  """

  @get_prize_pool_url "http://api.steampowered.com/IEconDOTA2_570/GetTournamentPrizePool/v1"

  @spec prize_pool(integer | nil) :: {:ok, integer, integer, integer}
  def prize_pool(league_id \\ nil, key \\ nil) do
    result = Dota2API.Request.load(
      @get_prize_pool_url, [league_id: league_id, key: key]
    )["result"]

    {
      :ok,
      result["league_id"],
      result["status"],
      result["prize_pool"]
    }
  end
end
