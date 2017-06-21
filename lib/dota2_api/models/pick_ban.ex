defmodule Dota2API.Model.PickBan do
  @type t :: %__MODULE__{
    hero_id: integer,
    is_pick: boolean,
    team: atom,
    order: integer
  }

  defstruct [:hero_id, :is_pick, :team, :order]

  alias Dota2API.Enum.Faction

  def build_from(list: nil) do
    []
  end

  def build_from(list: list) do
    list
      |> Enum.map(&__MODULE__.build_from/1)
  end

  def build_from(dict) do
    %__MODULE__{
      hero_id: dict["hero_id"],
      is_pick: dict["is_pick"],
      team: Faction.key(dict["team"]),
      order: dict["order"]
    }
  end
end
