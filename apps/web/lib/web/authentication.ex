defmodule Web.Authentication do
  @moduledoc """
  Allows signing in with email and password, adding the user as a resources
  in the conn and session and providing a token.
  """
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]
  alias Data.{User, Users}
  alias Web.Guardian

  def token_sign_in(email, password) do
    case email_password_auth(email, password) do
      {:ok, user} ->
        Guardian.encode_and_sign(user)

      _ ->
        {:error, :unauthorized}
    end
  end

  defp email_password_auth(email, password) when is_binary(email) and is_binary(password) do
    with {:ok, user} <- get_by_email(email),
         do: verify_password(password, user)
  end

  defp get_by_email(email) when is_binary(email) do
    case Users.get_by_email(email) do
      nil ->
        dummy_checkpw()
        {:error, "Login error."}

      user ->
        {:ok, user}
    end
  end

  defp verify_password(password, %User{} = user) when is_binary(password) do
    if checkpw(password, user.encrypted_password) do
      {:ok, user}
    else
      {:error, :invalid_password}
    end
  end
end
