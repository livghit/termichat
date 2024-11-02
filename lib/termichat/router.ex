defmodule Termichat.Router do
  use Plug.Router

  plug(Plug.Logger)

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  def init(_opts) do
    IO.puts("Server initiated ...")
  end

  # from here all the routes needed 
  get("/alive", do: send_resp(conn, 200, "Alive"))

  match(_, do: send_resp(conn, 404, "Not Found"))
end
