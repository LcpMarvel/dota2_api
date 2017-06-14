defmodule Dota2API.Enum.LobbyType do
  require EnumTool

  EnumTool.define(
    invalid: -1,
    public_matchmaking: 0,
    practise: 1,
    tournament: 2,
    tutorial: 3,
    cooperative_with_bots: 4,
    team_match: 5,
    solo_queue: 6,
    ranked: 7,
    one_vs_one_mid: 8
  )
end
