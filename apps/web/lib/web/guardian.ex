defmodule Web.Guardian do
  @moduledoc """
  Manages subjects and resources for tokens.
  """
  use Guardian, otp_app: :web
  alias Data.Users

  def subject_for_token(resource, _claims) do
    # You can use any value for the subject of your token but
    # it should be useful in retrieving the resource later, see
    # how it being used on `resource_from_claims/1` function.
    # A unique `id` is a good subject, a non-unique email address
    # is a poor subject.
    sub = to_string(resource.id)
    {:ok, sub}
  end

  # def subject_for_token(_, _) do
  #   {:error, :reason_for_error}
  # end

  def resource_from_claims(%{"sub" => id}) do
    resource = Users.get!(id)
    {:ok, resource}
  end

  def resource_from_claims(_claims) do
    {:error, "User ID not provided."}
  end
end
