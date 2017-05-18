defmodule Dota2API.Enums.Skill do
  @type t :: %__MODULE__{
    value: integer,
    name: String.t
  }
  defstruct [:value, :name]

  @callback value :: %__MODULE__{}

  @spec get(integer | any) :: t | nil
  def get(identity) do
    case identity do
      0 -> __MODULE__.Any
      1 -> __MODULE__.Normal
      2 -> __MODULE__.High
      4 -> __MODULE__.VeryHigh

      _ -> nil
    end
  end
end

defmodule Dota2API.Enums.Skill.Any do
  alias Dota2API.Enums.Skill
  @behaviour Skill

  def value do
    %Skill{ value: 0, name: "Any" }
  end
end

defmodule Dota2API.Enums.Skill.Normal do
  alias Dota2API.Enums.Skill
  @behaviour Skill

  def value do
    %Skill{ value: 1, name: "Normal" }
  end
end

defmodule Dota2API.Enums.Skill.High do
  alias Dota2API.Enums.Skill
  @behaviour Skill

  def value do
    %Skill{ value: 2, name: "High" }
  end
end

defmodule Dota2API.Enums.Skill.VeryHigh do
  alias Dota2API.Enums.Skill
  @behaviour Skill

  def value do
    %Skill{ value: 3, name: "Very High" }
  end
end
