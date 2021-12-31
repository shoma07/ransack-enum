# frozen_string_literal: true

require 'active_support'
require_relative 'ransack_enum/version'
require_relative 'ransack_enum/configuration'
require_relative 'ransack_enum/formatter'
require_relative 'ransack_enum/ransacker'
require_relative 'ransack_enum/adapters'

# RansackEnum
module RansackEnum
  # RansackEnum::Error
  class Error < StandardError; end

  class << self
    # @return [RansackEnum::Configuration]
    def config
      @config ||= ::RansackEnum::Configuration.new
    end

    # @yieldparam config [RansackEnum::Configuration]
    # @yieldreturn [void]
    # @return [void]
    def configure
      raise ::RansackEnum::Error, 'No block is given!' unless block_given?

      yield config
    end
  end
end
