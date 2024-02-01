defmodule Gi.Repo do
  use Ecto.Repo,
    otp_app: :gi,
    adapter: Ecto.Adapters.Postgres
end
