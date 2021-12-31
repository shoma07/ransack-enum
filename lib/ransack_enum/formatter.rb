# frozen_string_literal: true

module RansackEnum
  # RansackEnum::Formatter
  class Formatter
    # @param model_class [Class]
    # @param name [String]
    # @param values [Array, Hash]
    # @return [void]
    def initialize(model_class, name, values)
      @model_class = model_class
      @name = name
      @normalized_values = normalize_values(values)
    end

    # @param value [Object]
    # @return [Object]
    def call(value)
      value.is_a?(::Array) ? (value.map { |val| normalize_value(val) }) : normalize_value(value)
    end

    private

    # @!attribute [r] model_class
    # @return [Class]
    attr_reader :model_class
    # @!attribute [r] name
    # @return [String]
    attr_reader :name
    # @!attribute [r] normalized_values
    # @return [Hash]
    attr_reader :normalized_values

    # @param values [Array, Hash]
    # @return [Hash]
    def normalize_values(values)
      (values.is_a?(::Hash) ? values : [values, ::Array.new(values.size, &:itself)].transpose.to_h).symbolize_keys
    end

    # @param value [Object]
    # @return [Object]
    def normalize_value(value)
      enum_value(value).then { |val| cast_value(val.nil? ? value : val) }
    end

    # @param value [Object]
    # @return [Object]
    def enum_value(value)
      normalized_values[value.to_sym] if ::RansackEnum.config.enabled? && value.respond_to?(:to_sym)
    end

    # @param value [Object]
    # @return [Object]
    def cast_value(value)
      ::Ransack::Nodes::Value.new(nil, value).cast(model_class.attribute_types[name]&.type)
    end
  end
end
