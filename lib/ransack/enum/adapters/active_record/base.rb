# frozen_string_literal: true

module Ransack
  module Enum
    module Adapters
      module ActiveRecord
        # Ransack::Enum::Adapters::ActiveRecord::Base
        module Base
          # @see https://github.com/rails/rails/blob/66cabeda2c46c582d19738e1318be8d59584cc5b/activerecord/lib/active_record/enum.rb#L150
          # @param [Hash] definitions
          def enum(definitions)
            super
            enum_ransacker(definitions)
          end

          # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
          # @param [Hash] definitions
          def enum_ransacker(definitions)
            definitions.each do |name, values|
              fmt = lambda do |v|
                return values[v.to_sym] if values[v.to_sym]

                case columns_hash[name.to_s]&.type
                when :integer
                  v.to_i
                when :boolean
                  if ActiveRecord::VERSION::MAJOR >= 5
                    ActiveRecord::Type::Boolean.new.cast(v)
                  else
                    ActiveRecord::Type::Boolean.new.type_cast_from_database(v)
                  end
                else
                  v
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
