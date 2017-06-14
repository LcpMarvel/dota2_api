defmodule Dota2API.Mapper.GameItems do
  @moduledoc """
  Game items mapper.
  """
  alias Dota2API.Model.GameItem

  @get_game_items_url "http://api.steampowered.com/IEconDOTA2_570/GetGameItems/v1"

  @doc """
  Get game items.

  ## Example

      iex> {:ok, items} = Dota2API.Mapper.GameItems.load
      iex> List.first(items).__struct__ == Dota2API.Model.GameItem
      true
  """
  @spec load(String.t) :: {:ok, [GameItem]}
  def load(language \\ "en", key \\ nil) do
    result = Dota2API.Request.load(
      @get_game_items_url, [language: language, key: key]
    )["result"]

    {:ok, GameItem.build_from(list: result["items"])}
  end
end
