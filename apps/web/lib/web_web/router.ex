defmodule WebWeb.Router do
  use WebWeb, :router

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

  scope "/", WebWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  forward(
    "/graphql",
    Absinthe.Plug,
    schema: WebWeb.Schema
  )

  forward(
    "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: WebWeb.Schema,
    socket: WebWeb.UserSocket,
    interface: :playground
  )

  # Other scopes may use custom stacks.
  # scope "/api", WebWeb do
  #   pipe_through :api
  # end
end
