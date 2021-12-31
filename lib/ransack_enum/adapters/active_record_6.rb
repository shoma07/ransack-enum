# frozen_string_literal: true

module RansackEnum
  module Adapters
    # RansackEnum::Adapters::ActiveRecord6
    module ActiveRecord6
      # @param definitions [Hash]
      # @return [void]
      def enum(definitions)
        ::RansackEnum::Ransacker.new(self, nil, nil, **definitions.to_h.deep_dup).then do |enum_ransacker|
          super.tap { enum_ransacker.call }
        end
      end
    end

    private_constant :ActiveRecord6
  end
end
