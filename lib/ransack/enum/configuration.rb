# frozen_string_literal: true

module Ransack
  module Enum
    # Ransack::Enum::Configuration
    module Configuration
      mattr_accessor :options

      self.options = { enabled: true }

      def configure
        yield self
      end

      # @param [TrueClass, FalseClass] enabled
      # @return [TrueClass, FalseClass]
      def enabled=(enabled)
        options[:enabled] = enabled
      end

      # @return [TrueClass, FalseClass]
      def enabled?
        options[:enabled]
      end
    end
  end
end
