defmodule Dota2API.Enum.CommunityVisibilityState do
  require EnumTool

  EnumTool.define(
    private: 1,
    friends_only: 2,
    friends_of_friends: 3,
    users_only: 4,
    public: 5
  )
end
