defmodule Web.Schema.Page do
  @moduledoc """
    The user and authentication token after signing in.
  """
  use Absinthe.Schema.Notation

  @desc "The user and authentication token after signing in."
  object :page do
    field(:entries, list_of(:user))
    field(:page_number, :integer)
    field(:page_size, :integer)
    field(:total_pages, :integer)
    field(:total_entries, :integer)
    field(:sort_by, :string)
    field(:sort_order, :string)
  end
end
