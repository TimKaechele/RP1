module RP1
  module Types
    class Boolean
      def coerce_input(value)
        return nil if value.nil?
        true_values.include?(value)
      end

      def coerce_result(value)
        return nil if value.nil?
        value.to_s
      end

      private

      def true_values
        [1, true, 'TRUE', 't', 'true']
      end
    end
  end
end
