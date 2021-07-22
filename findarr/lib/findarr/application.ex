defmodule Findarr.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Findarr.Worker.start_link(arg)
      {Findarr.Server, {"42", :grommit}},
      {Findarr.Server, {"13", :wileycoyote}},
      {Findarr.Server, {"7", :ahsoka}},
      {Findarr.Server, {"27", :droopy}},
      {Findarr.Server, {"9", :naruto}},
      {Findarr.Server, {"23", :shaggy}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: Findarr.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
