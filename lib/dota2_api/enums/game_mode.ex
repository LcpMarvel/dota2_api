defmodule Dota2API.Enum.GameMode do
  require EnumTool

  EnumTool.define(
    none: 0,
    all_pick: 1,
    captain_mode: 2,
    random_draft: 3,
    single_draft: 4,
    all_random: 5,
    intro: 6,
    diretide: 7,
    reverse_captain_mode: 8,
    greeviling: 9,
    tutorial: 10,
    mid_only: 11,
    least_played: 12,
    new_player_pool: 13,
    compendium_matchmaking: 14,
    custom: 15,
    captain_draft: 16,
    balanced_draft: 17,
    ability_draft: 18,
    unknown_event: 19,
    all_random_death_match: 20,
    solo_mid: 21,
    ranked_all_pick: 22
  )

  @spec ranked_modes :: [atom]
  def ranked_modes do
    [:ranked_all_pick, :captain_draft, :random_draft]
  end
end
