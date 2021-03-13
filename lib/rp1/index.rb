# frozen_string_literal: true

module RP1
  class Index
    attr_accessor :property, :index_type

    def initialize(property, index_type)
      @property = property
      @index_type = index_type
    end
  end
end
