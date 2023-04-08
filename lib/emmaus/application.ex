defmodule Emmaus.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    token = case ExGram.Config.get(:ex_gram, :token) do
      {module, func, env} -> apply(module, func, [env])
      data -> data
    end

    children = [
      ExGram,
      {Emmaus.Bot, [method: :polling, token: token]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Emmaus.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
