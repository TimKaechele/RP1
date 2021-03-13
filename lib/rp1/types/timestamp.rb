module RP1
  module Types
    class Timestamp
      def coerce_input(value)
        return nil if value.nil?
        return value if value.is_a?(Time)

        Time.parse(value.to_s)
      end

      def coerce_result(value)
        return nil if value.nil?

        value.iso8601
      end
    end
  end
end
