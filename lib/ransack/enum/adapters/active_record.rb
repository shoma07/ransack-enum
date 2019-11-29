# frozen_string_literal: true

require 'ransack/enum/adapters/active_record/base'

module Ransack
  module Enum
    module Adapters
      # Ransack::Enum::Adapters::ActiveRecord
      module ActiveRecord
      end
    end
  end
end

ActiveSupport.on_load(:active_record) do
  extend Ransack::Enum::Adapters::ActiveRecord::Base
end
