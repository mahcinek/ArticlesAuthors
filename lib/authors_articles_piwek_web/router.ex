defmodule AAPiwekWeb.Router do
  use AAPiwekWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug AAPiwek.Guardian.AuthPipeline
  end

  scope "/api/v1", AAPiwekWeb do
    pipe_through :api
    resources "/authors", AuthorController, only: [:create]
  end

  scope "/api/v1", AAPiwekWeb do
    pipe_through [:api, :jwt_authenticated]
    resources "/authors", AuthorController, only: [:show]
    patch "/authors", AuthorController, :update
    put "/authors", AuthorController, :update
    resources "/articles", ArticleController, only: [:index, :create, :delete]
  end
end
