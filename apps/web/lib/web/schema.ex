defmodule Web.Schema do
  @moduledoc """
  Root schema for our data model.
  """
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(Web.Schema.Page)
  import_types(Web.Schema.Session)
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

    @desc "Get all users, paginated"
    field :users_page, :page do
      arg(:page, non_null(:integer))
      arg(:page_size, non_null(:integer))
      arg(:sort_by, non_null(:string))
      arg(:sort_order, non_null(:string))

      resolve(&Users.list/3)
    end

  end

  mutation do
    field :login, type: :session do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&Users.login/3)
    end

    field :create_user, type: :session do
      arg(:first_name, :string)
      arg(:last_name, :string)
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Users.create/3)
    end

    field :update_user, type: :user do
      arg :id, non_null(:integer)
      arg :user, :update_user_params

      resolve(&Users.update/3)
    end
  end

end
