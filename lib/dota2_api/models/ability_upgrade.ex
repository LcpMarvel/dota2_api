defmodule Dota2API.Models.AbilityUpgrade do
  @type t :: %__MODULE__{
    ability_id: integer,
    upgraded_at: integer,
    level: integer
  }

  defstruct [:ability_id, :upgraded_at, :level]

  def build_from(list: list) do
    list
      |> Enum.map(&__MODULE__.build_from/1)
  end

  def build_from(dict) do
    %__MODULE__{
      ability_id: dict["ability"],
      upgraded_at: dict["time"],
      level: dict["level"]
    }
  end
end
