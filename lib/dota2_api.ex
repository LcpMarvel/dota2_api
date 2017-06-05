defmodule Dota2API do
  @moduledoc """
  Documentation for Dota2 API.
  """

  def start(_type, _args) do
    Dota2API.Supervisor.start_link
  end
end
