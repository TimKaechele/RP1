module RP1
  module Types
    class Decimal
       def coerce_input(value)
        return nil if value.nil?
        value.to_d
      end

      def coerce_result(value)
        return nil if value.nil?
        value.to_d
      end
    end
  end
end
