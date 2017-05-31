defmodule Dota2API.Mappers.Heroes do
  @moduledoc """
  Heroes mapper.
  """

  alias Dota2API.Models.Hero

  @get_heroes_url "http://api.steampowered.com/IEconDOTA2_570/GetHeroes/v1"

  @doc """
  Get all heroes.

  ## Example

      iex> {:ok, heroes, count} = Dota2API.Mappers.Heroes.load
      iex> List.first(heroes).__struct__ == Dota2API.Models.Hero
      true
      iex> count > 0
      true
  """
  @spec load(String.t, boolean) :: {:ok, [Hero], integer}
  def load(language \\ "en", itemizedonly \\ false) do
    result = Utils.Request.load(
      @get_heroes_url,
      [
        language: language,
        itemizedonly: itemizedonly
      ]
    )["result"]

    {:ok, Hero.build_from(list: result["heroes"]), result["count"]}
  end
end
