defmodule LanguagesTest do
  use ExUnit.Case
  doctest Languages
  alias Languages.Language

  defmodule ExampleModule do
    use Languages
  end

  describe "from_code/1" do
    test "it has compiled options for codes" do
      vietnamese = %Language{name: "Vietnamese", code: "vi", native: "Tiếng Việt", rtl?: false}
      assert ExampleModule.from_code(:vi) == vietnamese
    end

    test "it handles non-existent matches" do
      assert ExampleModule.from_name(:nothing) == {:error, :invalid_name}
    end
  end

  describe "from_name/1" do
    test "it has compiled options for names" do
      assert %Language{code: "it"} = ExampleModule.from_name("Italian")
    end

    test "it handles non-existent matches" do
      assert ExampleModule.from_name(:nothing) == {:error, :invalid_name}
    end
  end
end
