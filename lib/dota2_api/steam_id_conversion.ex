defmodule Dota2API.SteamIdConversion do
  @type steam32 :: 0..2147483647
  @type steam64 :: 0..9223372036854775807

  @difference_value 76561197960265728

  @spec steam32_to_steam64(steam32) :: steam64
  def steam32_to_steam64(steam32) when is_integer(steam32) do
    steam32 + @difference_value
  end

  def steam32_to_steam64(steam32) when is_binary(steam32) do
    steam32
      |> String.to_integer
      |> steam32_to_steam64
  end

  @spec steam64_to_steam32(steam64) :: steam32
  def steam64_to_steam32(steam64) when is_integer(steam64) do
    steam64 - @difference_value
  end

  def steam64_to_steam32(steam64) when is_binary(steam64) do
    steam64
      |> String.to_integer
      |> steam64_to_steam32
  end
end
