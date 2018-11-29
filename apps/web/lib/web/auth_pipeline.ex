defmodule Web.AuthPipeline do
  @moduledoc """
  Add this to a scope to require authentication.
  """
  use Guardian.Plug.Pipeline,
    otp_app: :web,
    module: Web.Guardian,
    error_handler: Web.AuthErrorHandler

  plug(Guardian.Plug.VerifyHeader, realm: "Bearer")
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource)
end
