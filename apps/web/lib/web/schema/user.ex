defmodule Web.Schema.User do
  @moduledoc """
    Represents a user account.
  """
  use Absinthe.Schema.Notation
  # use Absinthe.Ecto, repo: Data.Repo

  @desc "User account"
  object :user do
    field(:id, :id)
    field(:email, :string)
    field(:password, :string)
  end

  input_object :update_user_params do
    field :email, :string
    field :password, :string
  end
end
