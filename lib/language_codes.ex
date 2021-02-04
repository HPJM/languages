defmodule LanguageCodes do
  @moduledoc """
  Documentation for `LanguageCodes`.
  """

  @external_resource codes_path = Path.join([__DIR__, "codes.json"])
  @codes codes_path |> File.read!() |> Jason.decode!()
end
