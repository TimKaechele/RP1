module RP1
  module Types
    class Float
      def coerce_input(value)
        return nil if value.nil?
        value.to_f
      end

      def coerce_result(value)
        return nil if value.nil?
        value.to_f
      end
    end
  end
end
