defmodule WebWeb.Schema.User do
  @moduledoc """
    Represents a user account.
  """
  use Absinthe.Schema.Notation

  @desc "User account"
  object :user do
    field(:id, :id)
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
  end
end
