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

  scope "/api", Web do
    pipe_through(:api)
    post("/sign_up", UserController, :create)
    post("/sign_in", UserController, :sign_in)
  end

  scope "/", Web do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  forward(
    "/graphql",
    Absinthe.Plug,
    schema: Web.Schema
  )

  forward(
    "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: Web.Schema,
    socket: Web.UserSocket,
    interface: :playground
  )
end
