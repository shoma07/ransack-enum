# frozen_string_literal: true

module Ransack
  module Enum
    module Adapters
      module ActiveRecord
        # Ransack::Enum::Adapters::ActiveRecord::Base
        module Base
          # @see https://github.com/rails/rails/blob/66cabeda2c46c582d19738e1318be8d59584cc5b/activerecord/lib/active_record/enum.rb#L150
          # @param [Hash] definitions
          # @return [Hash]
          def enum(definitions)
            result = super(definitions)
            if respond_to?(:ransacker)
              definitions.each do |name, values|
                enum_ransacker name, values
              end
            end
            result
          end

          # rubocop:disable Metrics/AbcSize
          # @param [Symbol] name
          # @param [Hash] values
          # @return [Hash]
          def enum_ransacker(name, values)
            lmd = lambda do |val|
              v = values[val.to_sym]
              return v if Ransack::Enum.options[:enabled] && v

              type = attribute_types[name.to_s]&.type
              Ransack::Nodes::Value.new(nil, val).cast(type)
            end

            ransacker name.to_sym, formatter: proc { |val|
              val.is_a?(Array) ? val.map { |v| lmd.call(v) } : lmd.call(val)
            }
          end
          # rubocop:enable Metrics/AbcSize
        end
      end
    end
  end
end
