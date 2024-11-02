defmodule Termichat.RouterTest do
  use ExUnit.Case, async: true

  use Plug.Test

  @opts Termichat.Router.init([])

  test "is alive" do
    connection = conn(:get, "/alive")
    conn = Termichat.Router.call(connection, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Alive"
  end

  test "it catches unkown routes" do
    connection = conn(:get, "/unknown-route")
    conn = Termichat.Router.call(connection, @opts)

    assert conn.state == :sent
    assert conn.status == 404
    assert conn.resp_body == "Not Found"
  end
end
