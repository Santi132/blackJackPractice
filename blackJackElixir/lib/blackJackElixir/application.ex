defmodule BlackJackElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BlackJackElixirWeb.Telemetry,
      # Start the Ecto repository
      BlackJackElixir.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: BlackJackElixir.PubSub},
      # Start Finch
      {Finch, name: BlackJackElixir.Finch},
      # Start the Endpoint (http/https)
      BlackJackElixirWeb.Endpoint
      # Start a worker by calling: BlackJackElixir.Worker.start_link(arg)
      # {BlackJackElixir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BlackJackElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BlackJackElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
