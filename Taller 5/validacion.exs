defmodule Validacion do
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

    validar_acceso(nombre, edad, credenciales, intentos)
  end

  def validar_acceso(nombre, edad, credenciales, intentos) do
    # Validar credenciales (unless)
    unless credenciales do
      {:error, "Acceso denegado: credenciales inválidas"}
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
end
