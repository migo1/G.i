defmodule GiWeb.GistLive do
  use GiWeb, :live_view

  alias Gi.Gists

  def mount(%{"id" => id}, _session, socket) do
    gist = Gists.get_gist!(id)
    {:ok, assign(socket, gist: gist)}
  end
end
