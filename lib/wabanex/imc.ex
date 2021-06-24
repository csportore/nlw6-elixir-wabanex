# Projeto criado com mix phx.new wabanex --no-html --no-webpack
# - phx é do Phoenix
# - Foi criado uma aplicação Web sem HTML e sem o Webpack

# iex -S mix
# Entra no modo interativo do Elixir

defmodule Wabanex.IMC do
  def calculate(%{"filename" => filename}) do
    # result = File.read(filename)
    # handle_result(result)

    # Com pipe operator (como o ps aux | grep chrome)
    # Isso evita de ficar criando variáveis ou reassociando-as
    filename
    # O nome do arquivo é passado para o método abaixo
    |> File.read()
    # o resultado é passado para o seguinte e assim por diante
    |> handle_result()

  end

  # Através de Pattern Matching, o Elixir sabe escolher qual desses dois
  # handle_result ele vai escolher
  # O segundo parâmetro é meramente uma variável que contém o valor
  # do resultado da operação anterior
  defp handle_result({:ok, content}) do
    data =
    content
    |> String.split("\r\n")
    |> Enum.map(fn line -> parse_line(line) end)
    |> Enum.into(%{})

    {:ok, data}
  end

  defp handle_result({:error, _reason}) do
    {:error, "Error while opening the file"}
  end

  defp parse_line(line) do
    line
    |> String.split(",")
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> calculate_imc()
  end

  # "Pattern matching" direto nos parâmetros da função
  # one-line functions não precisam de "end"
  defp calculate_imc([name, height, weight]), do: {name, weight / (height * height)}


end
