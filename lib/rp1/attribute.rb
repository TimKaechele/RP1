module RP1
  class Attribute
    attr_reader :name, :type, :default

    def initialize(name, type, default: nil)
      @name = name
      @type = type.new
      @default = default
    end

    def initialize_attribute(object)
      object.public_send("#{name}=".to_sym, resolve_default)
    end

    def coerce_input(value)
      type.coerce_input(value)
    end

    def coerce_result(value)
      type.coerce_result(value)
    end

    private

    def resolve_default
      if default.respond_to?(:call)
        default.call
      else
        default
      end
    end
  end
end
