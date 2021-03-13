require "active_model"
require "active_support"
require "active_support/all"

module RP1
  class Model
    include ActiveModel::Model

    class_attribute :attributes
    class_attribute :indexes

    self.attributes = Hash.new
    self.indexes = []

    def self.property(name, type: Types::String, default: nil)
      define_property_getter(name)
      define_property_setter(name)
      register_attribute(name, type, default)
    end

    def self.define_property_setter(name)
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set("@#{name}",
                              self.class.attributes[name.to_sym].coerce_input(value))
      end
    end

    def self.define_property_getter(name)
      define_method(name.to_sym) do
        instance_variable_get("@#{name}")
      end
    end

    def self.register_attribute(name, type, default)
      self.attributes[name.to_sym] = Attribute.new(name, type, default: default)
    end

    private_class_method :define_property_setter
    private_class_method :define_property_getter
    private_class_method :register_attribute

    property :id, type: RP1::Types::String, default: -> { SecureRandom.uuid }

    property :created_at, type: RP1::Types::Timestamp, default: -> { Time.now }
    property :updated_at, type: RP1::Types::Timestamp, default: -> { Time.now }

    def initialize(*args)
      initialize_attributes
      super
    end

    # @param property_name [String|Symbol]
    # @param type [Symbol]
    # @options type
    #   - set - allows you to easily check whether an item exists and retrieve it
    #   -       via it's key
    #   - sorted set - allows you to retrieve the items in a sorted order
    def self.index(property, type: :set)
      self.indexes.push(Index.new(property, type))
    end

    def self.redis_key(id)
      "#{name}:#{id}"
    end


    def save(persistence: RP1.persistence)
      persistence.save(self)
    end

    def self.find(id, persistence: RP1.persistence)
      persistence.find(self, id)
    end


    private

    def initialize_attributes
      self.class.attributes.values.each do |attribute|
        attribute.initialize_attribute(self)
      end
    end
  end
end
