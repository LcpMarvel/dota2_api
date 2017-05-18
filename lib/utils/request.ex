defmodule Utils.Request do
  @spec load(String.t, [{atom, any}]) :: HTTPoison.t
  def load(url, params) do
    options = [
      params: [key: Application.fetch_env!(:dota2_api, :key)] ++ params
    ]

    HTTPoison.get(url, [], options)
  end
end
