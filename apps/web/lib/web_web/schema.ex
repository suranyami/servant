defmodule WebWeb.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(WebWeb.Schema.User)
  alias WebWeb.Resolvers

  query do
    @desc "Get a user"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Users.find/3)
    end

    @desc "Get all users"
    field :users, list_of(:user) do
      resolve(&Resolvers.Users.list/3)
    end
  end

  mutation do
    field :create_user, :user do
      arg(:email, :string)
      arg(:first_name, :string)
      arg(:last_name, :string)

      resolve(&Resolvers.Users.create/3)
    end
  end
end
