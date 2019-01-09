defmodule Web.Router do
  use Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :login do
    plug Web.AuthContext
  end

  pipeline :graphql do
    plug Web.AuthPipeline
  end

  scope "/api" do
    pipe_through :graphql

    forward "/graphql",
      Absinthe.Plug,
      schema: Web.Schema,
      socket: Web.UserSocket
  end

  scope "/login" do
    pipe_through :login

    forward "/graphiql",
      Absinthe.Plug.GraphiQL,
      schema: Web.Schema,
      socket: Web.UserSocket
  end

  scope "/", Web do
    pipe_through(:browser)

    get("/", PageController, :index)
  end

end
