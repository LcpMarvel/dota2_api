defmodule Dota2API.Enums.LeaverStatus do
  @type t :: %__MODULE__{
    value: integer,
    name: String.t,
    description: String.t
  }

  defstruct [:value, :name, :description]

  @callback value :: %__MODULE__{}

  @spec get(integer | any) :: t | nil
  def get(identity) do
    case identity do
      0 -> __MODULE__.None
      1 -> __MODULE__.Disconnected
      2 -> __MODULE__.DisconnectedTooLong
      3 -> __MODULE__.Abandoned
      4 -> __MODULE__.AFK
      5 -> __MODULE__.NeverConnected
      6 -> __MODULE__.NeverConnectedTooLong

      _ -> nil
    end
  end
end

defmodule Dota2API.Enums.LeaverStatus.None do
  alias Dota2API.Enums.LeaverStatus
  @behaviour LeaverStatus

  def value do
    %LeaverStatus{ value: 0, name: "NONE", description: "finished match, no abandon" }
  end
end

defmodule Dota2API.Enums.LeaverStatus.Disconnected do
  alias Dota2API.Enums.LeaverStatus
  @behaviour LeaverStatus

  def value do
    %LeaverStatus{ value: 1, name: "DISCONNECTED", description: "player DC, no abandon" }
  end
end

defmodule Dota2API.Enums.LeaverStatus.DisconnectedTooLong do
  alias Dota2API.Enums.LeaverStatus
  @behaviour LeaverStatus

  def value do
    %LeaverStatus{ value: 2, name: "DISCONNECTED_TOO_LONG", description: "player DC > 5min, abandoned." }
  end
end

defmodule Dota2API.Enums.LeaverStatus.Abandoned do
  alias Dota2API.Enums.LeaverStatus
  @behaviour LeaverStatus

  def value do
    %LeaverStatus{ value: 3, name: "ABANDONED", description: "player DC, clicked leave, abandoned." }
  end
end

defmodule Dota2API.Enums.LeaverStatus.AFK do
  alias Dota2API.Enums.LeaverStatus
  @behaviour LeaverStatus

  def value do
    %LeaverStatus{ value: 4, name: "AFK", description: "player AFK, abandoned." }
  end
end

defmodule Dota2API.Enums.LeaverStatus.NeverConnected do
  alias Dota2API.Enums.LeaverStatus
  @behaviour LeaverStatus

  def value do
    %LeaverStatus{ value: 5, name: "NEVER_CONNECTED", description: "player never connected, no abandon." }
  end
end

defmodule Dota2API.Enums.LeaverStatus.NeverConnectedTooLong do
  alias Dota2API.Enums.LeaverStatus
  @behaviour LeaverStatus

  def value do
    %LeaverStatus{ value: 6, name: "NEVER_CONNECTED_TOO_LONG", description: "player took too long to connect, no abandon." }
  end
end
