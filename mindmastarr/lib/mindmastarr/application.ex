defmodule Mindmastarr.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Mindmastarr.Worker.start_link(arg)
      # {Mindmastarr.Worker, arg}
      {Mindmastarr.Server, :droopy},
      {Mindmastarr.Server, :grommit}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mindmastarr.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
