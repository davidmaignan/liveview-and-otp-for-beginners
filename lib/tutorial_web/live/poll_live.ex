defmodule TutorialWeb.PollLive do
  use TutorialWeb, :live_view

  alias Tutorial.PollResults

  def render(assigns) do
    ~H"""
    <div class="bg-indigo-200 h-screen w-screen">
      <div class="max-w-2xl mx-auto p-6">
        <div class="bg-white rounded-lg shadow-lg p-6">
          <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center">
            Vote in the Poll
          </h2>

          <div class="space-y-4 mb-6">
            <%= for {option, count} <- @votes do %>
              <div class="w-full">
                <button
                  phx-click="vote"
                  phx-value-option={option}
                  class="w-full px-6 py-3 bg-white border border-gray-300 rounded-lg
                       hover:bg-gray-50 transition-colors duration-200
                       flex justify-between items-center group"
                >
                  <span class="text-gray-700 font-medium">Option {option}</span>
                  <span class="bg-gray-100 text-gray-600 px-3 py-1 rounded-full
                             group-hover:bg-gray-200 transition-colors duration-200">
                    {count} votes
                  </span>
                </button>
              </div>
            <% end %>
          </div>

          <div class="text-center">
            <button
              phx-click="reset"
              class="px-6 py-2 bg-red-500 text-white rounded-lg
                   hover:bg-red-600 transition-colors duration-200
                   font-medium focus:outline-none focus:ring-2
                   focus:ring-red-500 focus:ring-offset-2"
            >
              Reset Poll
            </button>
          </div>
        </div>
      </div>
    </div>
    """
  end

  @pubsub_topic "poll"

  def mount(_params, _session, socket) do
    PollResults.subscribe_to_updates()
    {:ok, assign(socket, votes: PollResults.get_state())}
  end

  def handle_event("vote", %{"option" => option}, socket) do
    PollResults.vote(option)
    {:noreply, socket}
  end

  def handle_event("reset", _, socket) do
    PollResults.reset()
    {:noreply, socket}
  end

  def handle_info({:update_results, votes}, socket) do
    {:noreply, assign(socket, votes: votes)}
  end
end
