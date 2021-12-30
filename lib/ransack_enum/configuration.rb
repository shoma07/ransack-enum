# frozen_string_literal: true

module RansackEnum
  # RansackEnum::Configuration
  class Configuration
    # @!attribute [r] enabled
    # @return [Boolean]
    attr_reader :enabled

    # @return [void]
    def initialize
      @enabled = true
    end

    # @param enabled [Boolean]
    # @return [void]
    # @raise [ArgumentError]
    def enabled=(enabled)
      raise ArgumentError if !enabled.is_a?(TrueClass) && !enabled.is_a?(FalseClass)

      @enabled = enabled
    end

    # @return [Boolean]
    def enabled?
      @enabled
    end
  end
end
