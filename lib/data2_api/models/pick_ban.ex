defmodule Dota2API.Models.PickBan do
  @type t :: %__MODULE__{
    hero_id: integer,
    is_pick: boolean,
    team: integer,
    order: integer
  }

  defstruct [:hero_id, :is_pick, :team, :order]
end
