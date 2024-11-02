defmodule Termichat.Repo do
  use Ecto.Repo,
    otp_app: :termichat,
    adapter: Ecto.Adapters.SQLite3
end
