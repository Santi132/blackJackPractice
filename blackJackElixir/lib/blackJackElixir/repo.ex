defmodule BlackJackElixir.Repo do
  use Ecto.Repo,
    otp_app: :blackJackElixir,
    adapter: Ecto.Adapters.Postgres
end
