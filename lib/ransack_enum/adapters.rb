# frozen_string_literal: true

require_relative 'adapters/active_record_6'
require_relative 'adapters/active_record_7'

module RansackEnum
  # RansackEnum::Adapters
  module Adapters
    ::ActiveSupport.on_load(:active_record) do
      if Integer(::ActiveRecord::VERSION::STRING.split('.').first) >= 7
        extend ActiveRecord7
      else
        extend ActiveRecord6
      end
    end
  end

  private_constant :Adapters
end
