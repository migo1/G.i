defmodule GiWeb.CreateGistLive do
  use GiWeb, :live_view
  import Phoenix.HTML.Form
  alias Gi.{Gists, Gists.Gist}

  def mount(_params, _session, socket) do
    socket =
      assign(
        socket,
        form: to_form(Gists.change_gist(%Gist{}))
      )

    {:ok, socket}
  end
end
