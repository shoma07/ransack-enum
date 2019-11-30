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
            super
            enum_ransacker(definitions) if respond_to?(:ransacker)
          end

          # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
          # @param [Hash] definitions
          # @return [Hash]
          def enum_ransacker(definitions)
            definitions.each do |name, values|
              fmt = lambda do |v|
                if Ransack::Enum.options[:enabled] && values[v.to_sym]
                  values[v.to_sym]
                else
                  type = attribute_types[name.to_s]&.type
                  Ransack::Nodes::Value.new(nil, v).cast(type)
                end
              end

              formatter = proc do |val|
                if val.is_a?(Array)
                  val.map { |v| fmt.call(v) }
                else
                  fmt.call(val)
                end
              end

              ransacker name.to_sym, formatter: formatter
            end
          end
          # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
        end
      end
    end
  end
end
