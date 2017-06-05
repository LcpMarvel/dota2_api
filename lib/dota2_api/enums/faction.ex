defmodule Dota2API.Enums.Faction do
  @type t :: %__MODULE__{
    name: String.t
  }

  defstruct [:name]

  @callback value :: t
end

defmodule Dota2API.Enums.Faction.Radiant do
  alias Dota2API.Enums.Faction
  @behaviour Faction

  def value do
    %Faction{ name: "Radiant" }
  end
end

defmodule Dota2API.Enums.Faction.Dire do
  alias Dota2API.Enums.Faction
  @behaviour Faction

  def value do
    %Faction{ name: "Dire" }
  end
end
