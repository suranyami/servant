defmodule Data.UsersTest do
  use Data.DataCase
  alias Data.Users

  describe "Creating a user" do
    setup do
      {:ok, user} = Users.create("Fred", "Nurk", "fred@example.com", "secret999")
      {:ok, user: user}
    end
    test "is retrievable", %{user: user} do
      assert user.first_name == Users.get_by_email("fred@example.com").first_name
    end
  end
end
