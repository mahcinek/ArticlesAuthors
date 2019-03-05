defmodule AAPiwek.Repo do
  use Ecto.Repo,
    otp_app: :authors_articles_piwek,
    adapter: Ecto.Adapters.Postgres
end
