defmodule TutorialWeb.CookiesLive do
  use TutorialWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="min-h-screen flex flex-col items-center justify-center bg-gradient-to-b
    from-purple-900 to-red-900 text-white">
      <h1 class="absolute top-5 left-5 text-2xl font-bold">Cookie Clicker</h1>
      <div class="text-6xl mb-4">{@count}</div>
      <div
        class="text-9xl cursor-pointer select-none transition-transform duration-100
         hover:scale-110 active:scale-90"
        phx-click="increment"
        phx-keydown="increment"
        phx-key="Enter"
        phx-value-amount="1"
        tabindex="0"
      >
        🍪
      </div>
      <div class="mt-10 space-x-4">
        <button
          class="bg-blue-600 text-white py-2 px-4 rounded
        hover:bg-blue-700"
          phx-click="increment"
          phx-value-amount="1"
        >
          +1
        </button>

        <button
          class="bg-green-600 text-white py-2 px-4 rounded
        hover:bg-green-700"
          phx-click="increment"
          phx-value-amount="5"
        >
          +5
        </button>
        <button
          class="bg-red-600 text-white py-2 px-4 rounded
        hover:bg-red-700"
          phx-click="increment"
          phx-value-amount="10"
        >
          +10
        </button>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  @impl Phoenix.LiveView
  def handle_event("increment", %{"amount" => amount}, socket) do
    new_count = socket.assigns.count + String.to_integer(amount)
    socket = socket |> assign(:count, new_count)
    {:noreply, socket}
  end
end
