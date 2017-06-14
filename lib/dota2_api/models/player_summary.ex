defmodule Dota2API.Model.PlayerSummary do
  alias Dota2API.Enum.CommunityVisibilityState
  alias Dota2API.Enum.PersonaState

  alias Dota2API.SteamIdConversion

  @type t :: %__MODULE__{
    steam64_id: String.t,
    account_id: String.t,
    community_visibility_state: atom,
    profile_configured: boolean,
    display_name: String.t,
    last_sign_out_at: integer,
    profile_url: String.t,
    avatars: %{
      normal: String.t,
      full: String.t,
      medium: String.t
    },
    persona_state: atom,
    allow_public_comments: boolean,
    realname: String.t,
    primary_group_id: integer,
    created_at: integer,
    country_code: String.t,
    state_code: String.t,
    city_id: integer,
    current_game_id: integer,
    current_game_title: String.t,
    current_game_server_ip: String.t,
  }

  defstruct [
    :steam64_id, :account_id, :community_visibility_state, :profile_configured,
    :display_name, :last_sign_out_at, :profile_url, :avatars, :persona_state,
    :allow_public_comments, :realname, :primary_group_id, :created_at,
    :country_code, :state_code, :city_id,
    :current_game_id, :current_game_title, :current_game_server_ip
  ]

  @spec build_from(list: [map]) :: [t]
  def build_from(list: list) when is_list(list) do
    list
      |> Enum.map(&build_from/1)
  end

  @spec build_from(map) :: t
  def build_from(dict) do
    %__MODULE__{
      steam64_id: dict["steamid"],
      account_id: SteamIdConversion.steam64_to_steam32(dict["steamid"]) |> Integer.to_string,
      community_visibility_state: CommunityVisibilityState.key(dict["communityvisibilitystate"]),
      profile_configured: dict["profilestate"] === 1,
      display_name: dict["personaname"],
      last_sign_out_at: dict["lastlogoff"],
      profile_url: dict["profileurl"],
      avatars: %{
        normal: dict["avatar"],
        full: dict["avatarfull"],
        medium: dict["avatarmedium"]
      },
      persona_state: PersonaState.key(dict["personastate"]),
      # personastateflags unknown
      allow_public_comments: Map.has_key?(dict, "commentpermission"),
      realname: dict["realname"],
      primary_group_id: dict["primaryclanid"],
      created_at: dict["timecreated"],

      country_code: dict["loccountrycode"],
      state_code: dict["locstatecode"],
      city_id: dict["loccityid"],

      current_game_id: dict["gameid"],
      current_game_title: dict["gameextrainfo"],
      current_game_server_ip: dict["gameserverip"]
    }
  end
end
