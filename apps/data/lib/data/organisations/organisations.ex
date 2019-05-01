defmodule Data.Organisations do
  alias Data.{Organisation, Repo}
  import Ecto.Query, only: [from: 2]

  def list(
        %{
          page: _page,
          page_size: _page_size,
          sort_by: sort_by,
          sort_order: sort_order
        } = params
      ) do
    order_def =
      if sort_order == "desc" do
        [desc: String.to_atom(sort_by)]
      else
        [asc: String.to_atom(sort_by)]
      end

    query = from(o in Organisation, order_by: ^order_def)
    Repo.paginate(query, params)
  end

  def list do
    Repo.all(Organisation)
  end
end
