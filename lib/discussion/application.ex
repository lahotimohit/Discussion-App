defmodule Discussion.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DiscussionWeb.Telemetry,
      Discussion.Repo,
      {DNSCluster, query: Application.get_env(:discussion, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Discussion.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Discussion.Finch},
      # Start a worker by calling: Discussion.Worker.start_link(arg)
      # {Discussion.Worker, arg},
      # Start to serve requests, typically the last entry
      DiscussionWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Discussion.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DiscussionWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
