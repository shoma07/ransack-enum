# frozen_string_literal: true

module RansackEnum
  # RansackEnum::Ransacker
  class Ransacker
    # @param model_class [Class]
    # @param name [Symbol, nil]
    # @param values [Hash, nil]
    # @param options [Hash]
    # @return [void]
    def initialize(model_class, name = nil, values = nil, **options)
      @model_class = model_class
      if name
        @name = name
        @values = values || options
      else
        @name, @values = options.slice!(:_prefix, :_suffix, :_scopes, :_default).to_a.first
      end
    end

    # @return [void]
    def call
      return if !model_class.respond_to?(:ransacker) || !name || !values

      model_class.ransacker(name.to_sym, formatter: ::RansackEnum::Formatter.new(model_class, name.to_s, values))
    end

    private

    # @!attribute [r] model_class
    # @return [Class]
    attr_reader :model_class
    # @!attribute [r] name
    # @return [Symbol, nil]
    attr_reader :name
    # @!attribute [r] values
    # @return [Hash, nil]
    attr_reader :values
  end
end
