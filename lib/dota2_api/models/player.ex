defmodule Dota2API.Models.Player do
  alias Dota2API.Enums.LeaverStatus
  alias Dota2API.Models.AbilityUpgrade

  @type t :: %__MODULE__{
    account_id: integer,
    player_slot: String.t,
    hero_id: integer,
    items: [integer],
    backpack_items: [integer],
    kills_count: integer,
    deaths_count: integer,
    assists_count: integer,
    leaver_status: LeaverStatus.t,
    last_hits_count: integer,
    denies_count: integer,
    gold: integer,
    gold_per_minute: integer,
    experience_per_minute: integer,
    gold_spent: integer,
    hero_damage: integer,
    tower_damage: integer,
    hero_healing: integer,
    level: integer,
    ability_upgrades: [AbilityUpgrade.t]
  }

  defstruct [
    :account_id, :player_slot, :hero_id, :items, :backpack_items,
    :kills_count, :deaths_count, :assists_count,
    :leaver_status, :last_hits_count, :denies_count,
    :gold, :gold_per_minute, :experience_per_minute,
    :gold_spent, :hero_damage, :tower_damage, :hero_healing,
    :level, :ability_upgrades
  ]

  def build_digest_from(list: list) do
    list
      |> Enum.map(&__MODULE__.build_digest_from/1)
  end

  def build_digest_from(dict) do
    %__MODULE__{
      account_id: dict["account_id"],
      player_slot: player_slot(dict["player_slot"]),
      hero_id: dict["hero_id"]
    }
  end

  def build_from(list: list) do
    list
      |> Enum.map(&__MODULE__.build_from/1)
  end

  def build_from(dict) do
    %__MODULE__{
      account_id: dict["account_id"],
      player_slot: player_slot(dict["player_slot"]),
      hero_id: dict["hero_id"],
      items: [
        dict["item_0"], dict["item_1"], dict["item_2"],
        dict["item_3"], dict["item_4"], dict["item_5"]
      ],
      backpack_items: [
        dict["backpack_0"], dict["backpack_1"], dict["backpack_2"]
      ],
      kills_count: dict["kills"],
      deaths_count: dict["deaths"],
      assists_count: dict["assists"],
      leaver_status: LeaverStatus.get(dict["leaver_status"]),
      last_hits_count: dict["last_hits"],
      denies_count: dict["denies"],
      gold: dict["gold"],
      gold_per_minute: dict["gold_per_min"],
      experience_per_minute: dict["xp_per_min"],
      gold_spent: dict["gold_spent"],
      hero_damage: dict["hero_damage"],
      tower_damage: dict["tower_damage"],
      hero_damage: dict["hero_damage"],
      hero_healing: dict["hero_healing"],
      level: dict["level"],
      ability_upgrades: AbilityUpgrade.build_from(list: dict["ability_upgrades"])
    }
  end

  @spec player_slot(integer) :: String.t
  def player_slot(number) do
    number
      |> Integer.to_string(2)
      |> String.rjust(8, ?0)
  end
end
