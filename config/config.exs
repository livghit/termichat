import Config

config :termichat, Termichat.Repo,
  adapter: Ecto.Adapters.SQLite3,
  database: "db/termichat.sqlite3",
  pool_size: 5
