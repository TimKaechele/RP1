module RP1
  module Types
    class Integer
      def coerce_input(value)
        return nil if value.nil?
        value.to_i
      end

      def coerce_result(value)
        return nil if value.nil?
        value.to_s
      end
    end
  end
end
