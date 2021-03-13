class PropertyTestClass < RP1::Model

  property :string_type, type: RP1::Types::String
  property :boolean_type, type: RP1::Types::Boolean
  property :time_type, type: RP1::Types::Timestamp
  property :integer_type, type: RP1::Types::Integer
  property :float_type, type: RP1::Types::Float
end
