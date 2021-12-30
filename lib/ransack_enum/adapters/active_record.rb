# frozen_string_literal: true

require_relative 'active_record/base'

module RansackEnum
  module Adapters
    # RansackEnum::Adapters::ActiveRecord
    module ActiveRecord; end
  end
end

ActiveSupport.on_load(:active_record) do
  extend RansackEnum::Adapters::ActiveRecord::Base
end
