defmodule Dota2API.Models.GameItem do
  @game_item_prefix "item_"
  @image_base_url "http://cdn.dota2.com/apps/dota2/images/items/"

  @type t :: %__MODULE__{
    id: integer,
    name: String.t,
    cost: integer,
    secret_shop: integer,
    side_shop: integer,
    recipe: integer,
    localized_name: String.t,
    image: String.t
  }

  defstruct [:id, :name, :cost, :secret_shop, :side_shop, :recipe, :localized_name, :image]

  def build_from(list: list) do
    list
      |> Enum.map(&__MODULE__.build_from/1)
  end

  def build_from(dict) do
    @game_item_prefix <> item_name = dict["name"]

    %__MODULE__{
      id: dict["id"],
      name: item_name,
      cost: dict["cost"],
      secret_shop: dict["secret_shop"],
      side_shop: dict["side_shop"],
      recipe: dict["recipe"],
      localized_name: dict["localized_name"],
      image: @image_base_url <> item_name <> "_lg.png"
    }
  end
end
