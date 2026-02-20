defmodule Util do

  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_integer()
    rescue
      ArgumentError ->
        "Error, se espera un entero\n"
        |> Util.mostrar_error()

        mensaje
        |> ingresar(:entero)
    end
  end

  def ingresar(mensaje, :real) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_float()
    rescue
      ArgumentError ->
        "Error, se espera un número real\n"
        |> Util.mostrar_error()

        mensaje
        |> ingresar(:real)
    end
  end

  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

end
