defmodule Web.Schema do
  @moduledoc """
  Root schema for our data model.
  """
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(Web.Schema.User)
  alias Web.Resolvers.Users

  query do
    @desc "Get a user"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Users.find/3)
    end

    @desc "Get all users"
    field :users, list_of(:user) do
      resolve(&Users.list/3)
    end
  end

  mutation do
    field :create_user, :user do
      arg(:email, :string)
      arg(:first_name, :string)
      arg(:last_name, :string)

      resolve(&Users.create/3)
    end
  end
end
