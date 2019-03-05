defmodule AAPiwek.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :authors_articles_piwek,
  module: AAPiwek.Guardian,
  error_handler: AAPiwek.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
