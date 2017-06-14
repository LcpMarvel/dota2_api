defmodule Dota2API.Enum.Skill do
  require EnumTool

  EnumTool.define(
    any: 0,
    normal: 1,
    high: 2,
    very_high: 4
  )
end
