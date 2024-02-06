defmodule GiWeb.CreateGistLive do
  use GiWeb, :live_view
  import Phoenix.HTML.Form
  alias Gi.{Gists, Gists.Gist}

  def mount(_params, _session, socket) do
    IO.inspect(socket, label: "Socket before assignment")

    socket =
      assign(
        socket,
        form: to_form(Gists.change_gist(%Gist{}))
      )

    IO.inspect(socket, label: "Socket after assignment")

    {:ok, socket}
  end
end
