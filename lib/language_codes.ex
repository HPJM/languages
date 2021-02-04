defmodule Languages do
  @moduledoc """
  Allows querying of ISO codes for language name and codes.
  """

  @external_resource codes_path = Path.join([__DIR__, "codes.json"])
  @codes codes_path |> File.read!() |> Jason.decode!()

  defmodule Language do
    defstruct [:code, :name, :native, :rtl?]
  end

  defmacro __using__(_) do
    ast =
      for %{"code" => code, "name" => name, "native" => native} = language_code <- @codes do
        rtl? = Map.has_key?(language_code, "rtl")
        language_code = %Language{name: name, code: code, rtl?: rtl?, native: native}

        quote do
          def from_code(unquote(code |> String.to_atom())) do
            unquote(Macro.escape(language_code))
          end

          def from_name(unquote(name)) do
            unquote(Macro.escape(language_code))
          end
        end
      end

    quote do
      unquote(ast)

      def from_code(_) do
        {:error, :invalid_code}
      end

      def from_name(_) do
        {:error, :invalid_name}
      end
    end
  end
end
