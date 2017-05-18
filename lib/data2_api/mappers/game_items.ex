defmodule Dota2API.Mappers.GameItems do
  @moduledoc """
  Game items mapper.
  """

  alias HTTPoison.Response
  alias Dota2API.Models.GameItem

  @get_game_items_url "http://api.steampowered.com/IEconDOTA2_570/GetGameItems/v1"

  @doc """
  Get game items.

  ## Example

      iex> {:ok, items} = Dota2API.Mappers.GameItems.load
      iex> List.first(items).__struct__ == Dota2API.Models.GameItem
      true
  """
  @spec load(String.t) :: {:ok, [GameItem]}
  def load(language \\ "en") do
    {:ok, %Response{body: body}} = Utils.Request.load(
      @get_game_items_url, [language: language]
    )

    result = Poison.decode!(body)["result"]

    {:ok, GameItem.build_from(list: result["items"])}
  end
end
