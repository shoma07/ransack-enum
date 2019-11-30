# frozen_string_literal: true

module Ransack
  module Enum
    # Ransack::Enum::Configuration
    module Configuration
      mattr_accessor :options

      self.options = {
        enabled: true
      }

      def configure
        yield self
      end

      # @param [TrueClass, FalseClass] boolean
      def enabled=(boolean)
        options[:enabled] = boolean
      end
    end
  end
end
