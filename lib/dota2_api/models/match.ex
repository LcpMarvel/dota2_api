defmodule Dota2API.Models.Match do
  alias Dota2API.Models.Player
  alias Dota2API.Models.PickBan

  alias Dota2API.Enums.Faction.Radiant
  alias Dota2API.Enums.Faction.Dire
  alias Dota2API.Enums.LobbyType
  alias Dota2API.Enums.GameMode

  alias Dota2API.Mappers.Match

  @type t :: %__MODULE__{
    match_id: integer,
    match_sequence_number: integer,
    players: [Player.t],
    season: String.t,
    winner: [Dota2API.Enums.Faction.t],
    duration: integer,
    started_at: integer,
    tower_status_of_radiant: String.t,
    tower_status_of_dire: String.t,
    barracks_status_of_radiant: String.t,
    barracks_status_of_dire: String.t,
    server_cluster: integer,
    first_blood_occurred_at: integer,
    lobby_type: LobbyType.t,
    human_players_count: integer,
    league_id: integer,
    positive_votes_count: integer,
    negative_votes_count: integer,
    game_mode: GameMode.t,
    picks_bans: PickBan.t,
    flags: integer,
    engine: integer,
    radiant_score: integer,
    dire_score: integer
  }

  defstruct [
    :match_id, :match_sequence_number, :players, :season,
    :winner, :duration, :started_at,
    :tower_status_of_radiant, :tower_status_of_dire,
    :barracks_status_of_radiant, :barracks_status_of_dire,
    :server_cluster, :first_blood_occurred_at,
    :lobby_type, :human_players_count, :league_id,
    :positive_votes_count, :negative_votes_count,
    :game_mode, :picks_bans, :flags, :engine,
    :radiant_score, :dire_score
  ]

  def build_digest_from(list: list) do
    list
      |> Enum.map(&__MODULE__.build_digest_from/1)
  end

  def build_digest_from(dict) do
    %__MODULE__{
      match_id: dict["match_id"],
      match_sequence_number: dict["match_seq_num"],
      started_at: dict["start_time"],
      lobby_type: LobbyType.get(dict["lobby_type"]),
      players: Player.build_digest_from(list: dict["players"])
    }
  end

  def build_from(dict) do
    %__MODULE__{
      match_id: dict["match_id"],
      match_sequence_number: dict["match_seq_num"],
      players: Player.build_from(list: dict["players"]),
      season: dict["season"],
      winner: if(dict["radiant_win"], do: Radiant, else: Dire),
      duration: dict["duration"],
      started_at: dict["start_time"],
      tower_status_of_radiant: tower_status(dict["tower_status_radiant"]),
      tower_status_of_dire: tower_status(dict["tower_status_dire"]),
      barracks_status_of_radiant: barrack_status(dict["barracks_status_radiant"]),
      barracks_status_of_dire: barrack_status(dict["barracks_status_dire"]),
      server_cluster: dict["cluster"],
      first_blood_occurred_at: dict["first_blood_time"],
      lobby_type: LobbyType.get(dict["lobby_type"]),
      human_players_count: dict["human_players"],
      league_id: dict["leagueid"],
      positive_votes_count: dict["positive_votes"],
      negative_votes_count: dict["negative_votes"],
      game_mode: GameMode.get(dict["game_mode"]),
      # picks_bans: TODO
      flags: dict["flags"],
      engine: dict["engine"],
      radiant_score: dict["radiant_score"],
      dire_score: dict["dire_score"]
    }
  end

  def detail(match) do
    Match.load(match.match_id)
  end

  @spec tower_status(integer) :: String.t
  def tower_status(number) do
    number
      |> Integer.to_string(2)
      |> String.rjust(16, ?0)
  end

  @spec barrack_status(integer) :: String.t
  def barrack_status(number) do
    number
      |> Integer.to_string(2)
      |> String.rjust(8, ?0)
  end
end