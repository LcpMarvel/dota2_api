defmodule Dota2API.Enums.Faction do
  @type t :: %__MODULE__{
    name: String.t
  }

  defstruct [:value, :name]

  @callback value :: t
end

defmodule Dota2API.Enums.Faction.Radiant do
  alias Dota2API.Enums.Faction
  @behaviour Faction

  def value do
    %Faction{ value: 0, name: "Radiant" }
  end
end

defmodule Dota2API.Enums.Faction.Dire do
  alias Dota2API.Enums.Faction
  @behaviour Faction

  def value do
    %Faction{ value: 1, name: "Dire" }
  end
end
