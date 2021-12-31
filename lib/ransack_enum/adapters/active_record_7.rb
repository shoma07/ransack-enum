# frozen_string_literal: true

module RansackEnum
  module Adapters
    # RansackEnum::Adapters::ActiveRecord7
    module ActiveRecord7
      # @param name [Symbol, nil]
      # @param values [Hash, nil]
      # @param options [Hash]
      # @return [void]
      def enum(name = nil, values = nil, **options)
        ::RansackEnum::Ransacker.new(self, name, values.deep_dup, **options.deep_dup).then do |enum_ransacker|
          super.tap { enum_ransacker.call }
        end
      end
    end

    private_constant :ActiveRecord7
  end
end
