# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Data.Repo.insert!(%Data.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

1..10
|> Enum.each(fn _ ->
  email = Faker.Internet.email()
  first_name = Faker.Name.first_name()
  last_name = Faker.Name.last_name()
  password = Faker.String.base64(12)
  Data.Users.create(email, password)
  IO.puts("#{email} created")
end)
