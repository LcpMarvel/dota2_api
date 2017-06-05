use Mix.Config

keys =
  System.get_env("DOTA2_API_KEY")
    |> String.split(~r{,\s+}, trim: true)

config :dota2_api, keys: keys
