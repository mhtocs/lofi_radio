defmodule LofiRadio.Repo do
  use Ecto.Repo,
    otp_app: :lofi_radio,
    adapter: Ecto.Adapters.Postgres
end
