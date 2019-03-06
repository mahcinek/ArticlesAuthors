defmodule AAPiwekWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use AAPiwekWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(AAPiwekWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(AAPiwekWeb.ErrorView)
    |> render(:"403")
  end
  def call(conn, {:error, :unprocessable_entity}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(AAPiwekWeb.ErrorView)
    |> render(:"422")
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(AAPiwekWeb.ChangesetView)
    |> render(:"error", %{changeset: changeset})
  end
end
