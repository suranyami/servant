defmodule Web.Session do
  @moduledoc """
  Finds users and checks passwords.
  """
  alias Data.Users

  def login(email, password) do
    with {:ok, user} <- authenticate(email, password),
         {:ok, jwt, _} <- sign(user) do
      {:ok, %{token: jwt, user: user}}
    end
  end

  defp sign(user) do
    Web.Guardian.encode_and_sign(user)
  end

  defp authenticate(email, password) do
    email
    |> String.downcase()
    |> Users.get_by_email()
    |> check_password(password)
  end

  defp check_password(nil, _) do
    # This prevents timing attacks
    Comeonin.Bcrypt.dummy_checkpw()
    wrong_credentials()
  end

  defp check_password(user, password) do
    if Comeonin.Bcrypt.checkpw(password, user.encrypted_password) do
      {:ok, user}
    else
      wrong_credentials()
    end
  end

  defp wrong_credentials, do: {:error, "Incorrect login credentials"}
end
