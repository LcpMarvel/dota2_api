defmodule Dota2API.Models.Hero do
  @type t :: %__MODULE__{
    id: integer,
    name: String.t,
    hero_name: String.t,
    avatars: [
      small_horizontal: String.t,
      large_orizontal: String.t,
      full_quality_horizontal: String.t,
      full_quality_vertical: String.t
    ]
  }
  defstruct [:id, :name, :hero_name, :avatars]

  @hero_name_prefix "npc_dota_hero_"
  @avatar_base_url "http://cdn.dota2.com/apps/dota2/images/heroes/"

  def build_from(list: list) do
    list
      |> Enum.map(&__MODULE__.build_from/1)
  end

  def build_from(dict) do
    name = dict["name"]

    @hero_name_prefix <> hero_name = name

    url = @avatar_base_url <> hero_name <> "_"

    %__MODULE__{
      id: dict["id"],
      name: name,
      hero_name: hero_name,
      avatars: [
        small_horizontal: url <> "sb.png",
        large_orizontal: url <> "lg.png",
        full_quality_horizontal: url <> "full.png",
        full_quality_vertical: url <> "vert.jpg"
      ]
    }
  end
end
