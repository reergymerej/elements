defmodule Elements.Repo do
  use Ecto.Repo,
    otp_app: :elements,
    adapter: Ecto.Adapters.Postgres
end
