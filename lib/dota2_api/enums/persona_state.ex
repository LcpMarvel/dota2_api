defmodule Dota2API.Enum.PersonaState do
  require EnumTool

  EnumTool.define(
    offline: 0,
    online: 1,
    busy: 2,
    away: 3,
    snooze: 4,
    looking_to_trade: 5,
    looking_to_play: 6
  )
end
