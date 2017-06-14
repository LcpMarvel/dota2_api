defmodule Dota2API.Enum.LeaverStatus do
  require EnumTool

  EnumTool.define(
    none: 0,
    disconnected: 1,
    disconnected_too_long: 2,
    abandoned: 3,
    afk: 4,
    never_connected: 5,
    never_connected_too_long: 6
  )
end
