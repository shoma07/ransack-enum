# frozen_string_literal: true

require 'active_support/core_ext'
require 'ransack/enum/version'
require 'ransack/enum/adapters'
require 'ransack/enum/configuration'

module Ransack
  # Ransack::Enum
  module Enum
    extend Configuration
    class Error < StandardError; end
    # Your code goes here...
  end
end

Ransack::Enum.configure do |config|
  config.enabled = true
end
