defmodule Dota2API.Enums.GameMode do
  @type t :: %__MODULE__{
    value: integer,
    name: String.t
  }

  defstruct [:value, :name]

  @callback value :: t

  @spec get(integer | any) :: t | nil

  def get(identity) do
    case identity do
      0 -> __MODULE__.None
      1 -> __MODULE__.AllPick
      2 -> __MODULE__.CaptainMode
      3 -> __MODULE__.RandomDraft
      4 -> __MODULE__.SingleDraft
      5 -> __MODULE__.AllRandom
      6 -> __MODULE__.Intro
      7 -> __MODULE__.Diretide
      8 -> __MODULE__.ReverseCaptainMode
      9 -> __MODULE__.Greeviling
      10 -> __MODULE__.Tutorial
      11 -> __MODULE__.MidOnly
      12 -> __MODULE__.LeastPlayed
      13 -> __MODULE__.NewPlayerPool
      14 -> __MODULE__.CompendiumMatchmaking
      16 -> __MODULE__.CaptainDraft

      _ -> nil
    end
  end
end

defmodule Dota2API.Enums.GameMode.None do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 0, name: "None"}
  end
end

defmodule Dota2API.Enums.GameMode.AllPick do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 1, name: "All Pick" }
  end
end

defmodule Dota2API.Enums.GameMode.CaptainMode do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 2, name: "Captain's Mode" }
  end
end

defmodule Dota2API.Enums.GameMode.RandomDraft do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 3, name: "Random Draft" }
  end
end

defmodule Dota2API.Enums.GameMode.SingleDraft do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 4, name: "Single Draft" }
  end
end

defmodule Dota2API.Enums.GameMode.AllRandom do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 5, name: "All Random" }
  end
end

defmodule Dota2API.Enums.GameMode.Intro do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 6, name: "Intro" }
  end
end

defmodule Dota2API.Enums.GameMode.Diretide do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 7, name: "Diretide" }
  end
end

defmodule Dota2API.Enums.GameMode.ReverseCaptainMode do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 8, name: "Reverse Captain's Mode" }
  end
end

defmodule Dota2API.Enums.GameMode.Greeviling do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 9, name: "The Greeviling" }
  end
end

defmodule Dota2API.Enums.GameMode.Tutorial do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 10, name: "Tutorial" }
  end
end

defmodule Dota2API.Enums.GameMode.MidOnly do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 11, name: "Mid Only" }
  end
end

defmodule Dota2API.Enums.GameMode.LeastPlayed do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 12, name: "Least Played" }
  end
end

defmodule Dota2API.Enums.GameMode.NewPlayerPool do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 13, name: "New Player Pool" }
  end
end

defmodule Dota2API.Enums.GameMode.CompendiumMatchmaking do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 14, name: "Compendium Matchmaking" }
  end
end

defmodule Dota2API.Enums.GameMode.CaptainDraft do
  alias Dota2API.Enums.GameMode
  @behaviour GameMode

  def value do
    %GameMode{ value: 16, name: "Captain's Draft" }
  end
end