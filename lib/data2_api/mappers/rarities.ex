defmodule Dota2API.Mappers.Rarities do
  @moduledoc """
  Rarities mapper.
  """

  alias Dota2API.Models.Rarity

  @get_rarities_url "http://api.steampowered.com/IEconDOTA2_570/GetRarities/v1"

  @doc """
  Get all rarities.

  ## Example

      iex> {:ok, rarities, count} = Dota2API.Mappers.Rarities.load
      iex> List.first(rarities).__struct__ == Dota2API.Models.Rarity
      true
      iex> count > 0
      true
  """
  # @sepc load(String.t) :: {:ok, [Rarity.t], integer}
  def load(language \\ "en") do
    result = Utils.Request.load(
      @get_rarities_url, [language: language]
    )["result"]

    {:ok, Rarity.build_from(list: result["rarities"]), result["count"]}
  end
end
