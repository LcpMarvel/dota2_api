defmodule Dota2API.Model.Rarity do
  @type t :: %__MODULE__{
    id: integer,
    name: String.t,
    order: integer,
    color: String.t,
    localized_name: String.t
  }

  defstruct [:id, :name, :order, :color, :localized_name]

  def build_from(list: nil) do
    []
  end
  def build_from(list: list) do
    list
      |> Enum.map(&__MODULE__.build_from/1)
  end

  def build_from(dict) do
    %__MODULE__{
      id: dict["id"],
      name: dict["name"],
      order: dict["order"],
      color: dict["color"],
      localized_name: dict["localized_name"],
    }
  end
end
