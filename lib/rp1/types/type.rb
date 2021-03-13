module RP1
  module Types
    class Type
      def coerce_input(value)
        raise NotImplementedError
      end

      def coerce_result(value)
        raise NotImplementedError
      end
    end
  end
end
