1..100
|> Enum.map(fn _ ->
  email = Faker.Internet.email()
  first_name = Faker.Person.first_name()
  last_name = Faker.Person.last_name()
  password = Faker.String.base64(12)
  Data.Users.create(first_name, last_name, email, password)
  IO.puts("#{first_name} #{last_name} #{email} created")
end)
