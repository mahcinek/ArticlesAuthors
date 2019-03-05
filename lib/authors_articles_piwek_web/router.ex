defmodule AAPiwekWeb.Router do
  use AAPiwekWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AAPiwekWeb do
    pipe_through :api
    resources "/authors", AuthorController, only: [:create, :show, :update]
  end
end
