defmodule Mod do
  defmacro definfo do
    IO.puts("In macro's context (#{__MODULE__}).")

    quote do
      IO.puts("In caller's context (#{__MODULE__}).")

      def friendly_info do
        IO.puts("""
        My name is #{__MODULE__}
        My functions are #{inspect(__MODULE__.__info__(:functions))}
        """)
      end
    end
  end
end

defmodule MyModule do
  require Mod
  Mod.definfo()
end
