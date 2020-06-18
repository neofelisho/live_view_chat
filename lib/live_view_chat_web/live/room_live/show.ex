defmodule LiveViewChatWeb.RoomLive.Show do
  use LiveViewChatWeb, :live_view

  alias LiveViewChat.Chats

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:room, Chats.get_room!(id))}
  end

  defp page_title(:show), do: "Show Room"
  defp page_title(:edit), do: "Edit Room"
end
