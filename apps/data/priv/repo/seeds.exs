1..10
|> Enum.each(fn _ ->
  email = Faker.Internet.email()
  first_name = Faker.Name.first_name()
  last_name = Faker.Name.last_name()
  password = Faker.String.base64(12)
  Data.Users.create(first_name, last_name, email, password)
  IO.puts("#{first_name} #{last_name} #{email} created")
end)
