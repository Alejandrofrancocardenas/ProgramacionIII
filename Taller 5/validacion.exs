defmodule Validacion do
  @moduledoc """


    Pensamiento computacional :
    Descomposición: (validar credenciales, edad y cantidad de intentos).
    Reconocimiento de patrones: Identificar que la validación de cada criterio sigue una estructura similar (condicionales).
    Abstracción: Enfocarse en los aspectos esenciales de cada criterio de validación
    Algoritmo: Crear un conjunto de pasos para validar cada criterio y determinar el resultado final.

    Validación de acceso a un sistema basado en múltiples criterios:
    - Credenciales válidas (si/no)
    - Edad del usuario (debe ser mayor de 18 años)
    - Cantidad de intentos (máximo 3 intentos)
  """
  def main do
    nombre =
      "Ingrese nombre de usuario: "
      |> Util.ingresar(:texto)

    edad =
      "Ingrese la edad del usuario: "
      |> Util.ingresar(:entero)

    credenciales =
      "Posee Credenciales? (si/no): "
      |> Util.ingresar(:texto)

    intentos =
      "Ingrese cantidad de intentos: "
      |> Util.ingresar(:entero)

    resultado = validar_acceso(nombre, edad, credenciales, intentos)
    mostrar_resultado(resultado)
  end

  def validar_acceso(nombre, edad, credenciales, intentos) do
    # Validar credenciales (unless)
    unless credenciales != "si" do
      {:error, "Acceso denegado: el usuario #{nombre} tiene credenciales inválidas"}
    else
      # Validar edad (if)
      if edad < 18 do
        {:error, "Acceso restringido: usuario menor de edad"}
      else
        # Validar intentos (if)
        if intentos >= 3 do
          {:error, "Cuenta bloqueada por múltiples intentos fallidos"}
        else
          {:ok, "Acceso concedido"}
        end
      end
    end
  end

  def mostrar_resultado({resultado}) do
    {:ok, mensaje} = resultado
    IO.puts(mensaje)
  end

  def mostrar_resultado({:error, mensaje}) do
    IO.puts(mensaje)
  end
end

Validacion.main()
