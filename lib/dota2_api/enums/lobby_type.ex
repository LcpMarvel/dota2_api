defmodule Dota2API.Enums.LobbyType do
  @type t :: %__MODULE__{
    value: integer,
    name: String.t
  }
  defstruct [:value, :name]

  @callback value :: %__MODULE__{}

  @spec get(integer | any) :: t | nil
  def get(identity) do
    case identity do
      -1 -> __MODULE__.Invalid
      0 -> __MODULE__.PublicMatchmaking
      1 -> __MODULE__.Practise
      2 -> __MODULE__.Tournament
      3 -> __MODULE__.Tutorial
      4 -> __MODULE__.CooperativeWithBots
      5 -> __MODULE__.TeamMatch
      6 -> __MODULE__.SoloQueue
      7 -> __MODULE__.Ranked
      8 -> __MODULE__.OneVSOneMid

      _ -> nil
    end
  end
end

defmodule Dota2API.Enums.LobbyType.Invalid do
  alias Dota2API.Enums.LobbyType
  @behaviour LobbyType

  def value do
    %LobbyType { value: -1, name: "Invalid" }
  end
end

defmodule Dota2API.Enums.LobbyType.PublicMatchmaking do
  alias Dota2API.Enums.LobbyType
  @behaviour LobbyType

  def value do
    %LobbyType { value: 0, name: "Public matchmaking" }
  end
end

defmodule Dota2API.Enums.LobbyType.Practise do
  alias Dota2API.Enums.LobbyType
  @behaviour LobbyType

  def value do
    %LobbyType { value: 1, name: "Practise" }
  end
end

defmodule Dota2API.Enums.LobbyType.Tournament do
  alias Dota2API.Enums.LobbyType
  @behaviour LobbyType

  def value do
    %LobbyType { value: 2, name: "Tournament" }
  end
end

defmodule Dota2API.Enums.LobbyType.Tutorial do
  alias Dota2API.Enums.LobbyType
  @behaviour LobbyType

  def value do
    %LobbyType { value: 3, name: "Tutorial" }
  end
end

defmodule Dota2API.Enums.LobbyType.CooperativeWithBots do
  alias Dota2API.Enums.LobbyType
  @behaviour LobbyType

  def value do
    %LobbyType { value: 4, name: "Cooperative with bots" }
  end
end

defmodule Dota2API.Enums.LobbyType.TeamMatch do
  alias Dota2API.Enums.LobbyType
  @behaviour LobbyType

  def value do
    %LobbyType { value: 5, name: "Team match" }
  end
end

defmodule Dota2API.Enums.LobbyType.SoloQueue do
  alias Dota2API.Enums.LobbyType
  @behaviour LobbyType

  def value do
    %LobbyType { value: 6, name: "Solo Queue" }
  end
end

defmodule Dota2API.Enums.LobbyType.Ranked do
  alias Dota2API.Enums.LobbyType
  @behaviour LobbyType

  def value do
    %LobbyType { value: 7, name: "Ranked" }
  end
end

defmodule Dota2API.Enums.LobbyType.OneVSOneMid do
  alias Dota2API.Enums.LobbyType
  @behaviour LobbyType

  def value do
    %LobbyType { value: 8, name: "1v1 Mid" }
  end
end
