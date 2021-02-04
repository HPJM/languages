# Languages

This is intended to be a utility module getting ISO language information from codes and names.

[Credit for the language JSON file](https://gist.github.com/joshuabaker/d2775b5ada7d1601bcd7b31cb4081981)

## Examples

You can use `from_code/1` to lookup a language by code (e.g. `:it`), and `from_name/1` to lookup by name (e.g. `"Arabic"`).

`from_code/1` expects atoms, `from_name/1` expects binaries.

A successful lookup returns a `%Languages.Language{}` struct while no match returns an `{:error, msg}` tuple.

```elixir
defmodule YourModule do
  use Languages

  def is_rtl?(code) when is_atom(code) do
    code
    |> from_code()
    |> Map.fetch!(:rtl?)
  end

  def is_rtl?(name) when is_binary(name) do
    name
    |> from_name()
    |> Map.fetch!(:rtl?)
  end
end
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `languages` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:languages, "~> 0.1.0"}
  ]
end
```
