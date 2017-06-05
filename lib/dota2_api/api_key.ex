defmodule Dota2API.ApiKey do
  use GenServer
  use Timex

  def start_link do
    GenServer.start_link(__MODULE__, fetch_keys(), name: __MODULE__)
  end

  def get do
    GenServer.call(__MODULE__, :get)
  end

  def remove(key) do
    GenServer.cast(__MODULE__, {:remove, key})
  end

  # Callbacks
  def init(keys) do
    :timer.send_after(milliseconds_to_regain(), __MODULE__, :regain)

    {:ok, keys}
  end

  def handle_call(:get, _from, [key|keys]) do
    {:reply, key, keys ++ [key]}
  end

  def handle_cast({:remove, key}, state) do
    new_state = Enum.filter(state, fn(k) -> k != key end)

    {:noreply, new_state}
  end

  def handle_info(:regain, _state) do
    {:stop, :normal, fetch_keys()}
  end

  def fetch_keys do
    Application.fetch_env!(:dota2_api, :keys)
  end

  def milliseconds_to_regain do
    now = Timex.now
    end_of_day = Timex.Timezone.end_of_day(now)

    Timex.diff(end_of_day, now, :milliseconds)
  end
end
