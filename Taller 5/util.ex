defmodule Util do
  def ingresar(mensaje, :texto) do
    IO.gets(mensaje)
    |> String.trim()
  end

  def ingresar(mensaje, :entero) do
    IO.gets(mensaje)
    |> String.trim()
    |> String.to_integer()
  end

  def ingresar(mensaje, :booleano) do
    IO.gets(mensaje)
    |> String.trim()
    |> String.downcase()
    |> convertir_booleano()
  end

  defp convertir_booleano("true"), do: true
  defp convertir_booleano("false"), do: false
  defp convertir_booleano(_), do: false
end
