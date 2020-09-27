# frozen_string_literal: true

require 'ransack/enum/adapters/active_record/base'

ActiveSupport.on_load(:active_record) do
  extend Ransack::Enum::Adapters::ActiveRecord::Base
end
