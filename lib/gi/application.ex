defmodule Gi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GiWeb.Telemetry,
      Gi.Repo,
      {DNSCluster, query: Application.get_env(:gi, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Gi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Gi.Finch},
      # Start a worker by calling: Gi.Worker.start_link(arg)
      # {Gi.Worker, arg},
      # Start to serve requests, typically the last entry
      GiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
