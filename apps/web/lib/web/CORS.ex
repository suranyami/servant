defmodule Web.CORS do
  @moduledoc """
  Allow certain host origins.
  """
  use Corsica.Router,
    origins: [
      "http://localhost:8080",
      "http://localhost:8080/?",
      # "http://localhost",
      # "http://localhost:4000",
      # ~r{^https?://(.*\.?)example\.com$}
    ],
    allow_credentials: true,
    max_age: 600,
    allow_headers: ["authorization", "content-type", "accept"],
    allow_methods: :all,
    log: [rejected: :debug, accepted: :debug, invalid: :debug]

  resource "/api/graphql", origins: "*"
  resource "/*"
end
