defmodule Web.Schema.Session do
  @moduledoc """
    The user and authentication token after signing in.
  """
  use Absinthe.Schema.Notation

  @desc "The user and authentication token after signing in."
  object :session do
    field(:user, :user)
    field(:token, :string)
  end
end
