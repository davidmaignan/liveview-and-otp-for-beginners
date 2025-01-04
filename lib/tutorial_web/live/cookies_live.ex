defmodule TutorialWeb.CookiesLive do
  use TutorialWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="min-h-screen flex flex-col items-center justify-center bg-gradient-to-b from-purple-900 to-red-900 text-white">
      <h1 class="absolute top-5 left-5 text-2xl font-bold">Cookie Clicker</h1>
      <div
        class="text-9xl cursor-pointer select-none transition-transform duration-100 hover:scale-110 active:scale-90"
      >
        🍪
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end
end
