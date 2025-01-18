defmodule TutorialWeb.BeatlesLive do
  use TutorialWeb, :live_view

  alias Tutorial.Beatles

  def render(assigns) do
    ~H"""
    <div class="flex h-screen bg-slate-200">
      <div class="w-64 bg-slate-700 text-white shadow-md px-4 py-6">
        <h2 class="text-lg font-bold mb-4">
          <.link patch={~p"/beatles"}>Beatles</.link>
          <.link navigate={~p"/albums"} class="text-sm hover:underline font-normal">
            View albums
          </.link>
        </h2>
        <ul class="space-y-2">
          <li :for={beatle <- @beatles} class="hover:bg-slate-600 rounded">
            <.link patch={~p"/beatles/#{beatle}"} class="block p-2 w-full h-full">
              {beatle.name}
            </.link>
          </li>
        </ul>
      </div>

      <div class="flex-1 p-6">
        <div :if={@beatle} class="bg-white shadow-md p-4 rounded-lg">
          <img
            src={"/images/" <> @beatle.photo}
            alt={"Photo of #{@beatle.name}"}
            class="w-32 h-32 rounded-full object-cover mb-4"
          />
          <h1 class="text-xl font-bold mb-2">{@beatle.name}</h1>
          <p class="text-gray-600 mb-1"><strong>Instrument:</strong> {@beatle.instrument}</p>
          <p class="text-gray-600 mb-1">
            <strong>Date of Birth:</strong> {Timex.format!(@beatle.dob, "{Mfull} {D}, {YYYY}")}
          </p>
        </div>

        <div :if={!@beatle} class="bg-white shadow-md p-4 rounded-lg">
          Select a Beatle from the sidebar
        </div>
      </div>
    </div>
    """
  end

  def mount(_, _session, socket) do
    beatles = Beatles.list_beatles()

    {:ok, assign(socket, beatles: beatles)}
  end

  def handle_params(params, _uri, socket) do
    beatle =
      case Map.fetch(params, "id") do
        {:ok, id} -> Enum.find(socket.assigns.beatles, &(to_string(&1.id) == id))
        :error -> nil
      end

    {:noreply, assign(socket, beatle: beatle)}
  end
end
