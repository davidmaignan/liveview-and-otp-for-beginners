defmodule Tutorial.PollResults do
  use GenServer

  @initial_state %{
    "A" => 0,
    "B" => 0,
    "C" => 0,
    "D" => 0
  }

  def start do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def get_state do
    GenServer.call(__MODULE__, :get_state)
  end

  def init(_) do
    {:ok, @initial_state}
  end

  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end
end
