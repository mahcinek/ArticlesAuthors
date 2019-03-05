defmodule AAPiwek.Guardian do
  use Guardian, otp_app: :authors_articles_piwek

  def subject_for_token(author, _claims) do
    sub = to_string(author.id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = AAPiwek.Auth.get_author!(id)
    {:ok,  resource}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
