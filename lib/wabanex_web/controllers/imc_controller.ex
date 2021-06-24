#chamar com a URL http://localhost:4000/api?filename=students.csv

defmodule WabanexWeb.IMCController do
  # Isso faz com que as funcionalidades de um controller
  # venham para o módulo
  use WabanexWeb, :controller

  # Cria-se um apelido (último nome dele, por padrão)
  alias Wabanex.IMC

  # Conexão e parametros da conexão
  def index(conn, params) do
    params
    |> IMC.calculate()
    |> handle_response(conn)
    # IO.inspect(params)
    # IO.inspect(conn)
    # conn
    # |> text("test")
  end

  def handle_response({:ok, result}, conn), do: render_response(conn, result, :ok)

  def handle_response({:error, result}, conn), do: render_response(conn, result, :bad_request)

  defp render_response(conn, result, status) do
    conn
    |> put_status(status)
    |> json(%{result: result})
  end
end
