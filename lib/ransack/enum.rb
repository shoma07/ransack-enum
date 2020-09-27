# frozen_string_literal: true

require 'active_support/core_ext'
require 'ransack'
require 'ransack/enum/version'
require 'ransack/enum/configuration'
require 'ransack/enum/adapters/active_record'

module Ransack
  # Ransack::Enum
  module Enum
    extend Configuration
  end
end
