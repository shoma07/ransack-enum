# frozen_string_literal: true

module RansackEnum
  module Adapters
    module ActiveRecord
      # RansackEnum::Adapters::ActiveRecord::Base
      module Base
        # @see https://github.com/rails/rails/blob/3db736bc2db2763d3a4360e73ff70179c8647eb4/activerecord/lib/active_record/enum.rb#L167
        #
        # @param [Hash] definitions
        # @return [Hash]
        def enum(definitions)
          copy_definitions = definitions.dup
          super(definitions).tap do
            if respond_to?(:ransacker)
              name, values = copy_definitions.to_a.first
              ransacker(name, formatter: ::RansackEnum::Formatter.new(self, name.to_s, values))
            end
          end
        end
      end
    end
  end
end
