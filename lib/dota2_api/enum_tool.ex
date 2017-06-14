defmodule EnumTool do
  defmacro define(enum) when is_list(enum) do
    quote bind_quoted: [enum: enum] do
      Enum.map enum, fn({k, v}) ->
        @spec key!(integer) :: atom | no_return
        def key!(unquote(v)) do
          unquote(k)
        end

        @spec key(integer) :: atom | nil
        def key(raw_value) do
          try do
            key!(raw_value)
          rescue
            _ ->
              nil
          end
        end

        @spec raw_value(atom) :: integer
        def raw_value(unquote(k)) do
          unquote(v)
        end
      end

      @spec enum :: Keyword.t
      def enum do
        unquote(enum)
      end
    end
  end
end
