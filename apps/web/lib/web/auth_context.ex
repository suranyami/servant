defmodule Web.AuthContext do
  @moduledoc """
  If there is a current_resource attached to the auth token,
  set it on the conn.
  """
  @behaviour Plug
  import Plug.Conn

  def init(opts) do
     opts
   end

  def call(conn, _) do
    conn
    |> Guardian.Plug.current_resource()
    |> set_user(conn)
  end

  defp set_user(nil, conn), do: conn

  defp set_user(user, conn) do
    put_private(conn, :absinthe, %{context: %{current_user: user}})
  end
end
