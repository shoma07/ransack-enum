# frozen_string_literal: true

module RansackEnum
  module Adapters
    module ActiveRecord
      # RansackEnum::Adapters::ActiveRecord::Base
      module Base
        # @see https://github.com/rails/rails/blob/66cabeda2c46c582d19738e1318be8d59584cc5b/activerecord/lib/active_record/enum.rb#L150
        # @param [Hash] definitions
        # @return [Hash]
        def enum(definitions)
          enum_ransacker(*definitions.to_a.first) if respond_to?(:ransacker)
          super
        end

        private

        # @param [Symbol] name
        # @param [Hash] values
        # @return [Hash]
        def enum_ransacker(name, values)
          enum_ransack_value_converter(name.to_s, values).then do |converter|
            ransacker(
              name,
              formatter: lambda do |value|
                value.is_a?(Array) ? value.map(&converter) : converter.call(value)
              end
            )
          end
        end

        # @param [String] name
        # @param [Hash] values
        # @return [Proc]
        def enum_ransack_value_converter(name, values)
          lambda do |value|
            val = values[value.to_sym]
            return val if RansackEnum.config.enabled? && !val.nil?

            Ransack::Nodes::Value.new(nil, value).cast(attribute_types[name]&.type)
          end
        end
      end
    end
  end
end
