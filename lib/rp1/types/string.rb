module RP1
  module Types
    class String
      def coerce_input(value)
        return nil if value.nil?

        value.to_s
      end

      def coerce_result(value)
        return nil if value.nil?

        value.to_s
      end
    end
  end
end
