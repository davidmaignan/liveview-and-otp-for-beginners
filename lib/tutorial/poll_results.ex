defmodule Tutorial.PollResults do
  alias Phoenix.PubSub
  use GenServer

  @pubsub_topic "poll"

  @initial_state %{
    "A" => 0,
    "B" => 0,
    "C" => 0,
    "D" => 0
  }

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def get_state do
    GenServer.call(__MODULE__, :get_state)
  end

  def subscribe_to_updates do
    PubSub.subscribe(Tutorial.PubSub, @pubsub_topic)
  end`-`

  def vote(option) do
    GenServer.cast(__MODULE__, {:vote, option})
  end

  def reset do
    GenServer.cast(__MODULE__, :reset)
  end

  def init(_) do
    {:ok, @initial_state}
  end

  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:vote, option}, state) do
    new_state = Map.update!(state, option, &(&1 + 1))
    broadcast_update(new_state)
    {:noreply, new_state}
  end

  def handle_cast(:reset, _state) do
    broadcast_update(@initial_state)
    {:noreply, @initial_state}
  end

  defp broadcast_update(state) do
    PubSub.broadcast(Tutorial.PubSub, @pubsub_topic, {:update_results, state})
  end
end
