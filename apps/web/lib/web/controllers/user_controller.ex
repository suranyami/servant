defmodule Web.UserController do
  use Web, :controller

  alias Data.{User, Users}
  alias Guardian.Plug
  alias Web.{Guardian, Session}

  action_fallback(Web.FallbackController)

  def sign_in(conn, %{"email" => email, "password" => password}) do
    with {:ok, %{token: jwt}} <- Session.login(email, password) do
        conn
        |> render("jwt.json", jwt: jwt)
    else
      _ ->
        {:error, :unauthorized}
    end
  end

  def index(conn, _params) do
    users = Users.list()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Users.create(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> render("jwt.json", jwt: token)
    end
  end

  def show(conn, _params) do
    user = Plug.current_resource(conn)
    conn |> render("user.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Users.get(id)

    with {:ok, %User{} = user} <- Users.update(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get(id)

    with {:ok, %User{}} <- Users.delete(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
