# frozen_string_literal: true

require 'active_support/core_ext'
require 'ransack'
require_relative 'ransack_enum/version'
require_relative 'ransack_enum/configuration'
require_relative 'ransack_enum/adapters'

# RansackEnum
module RansackEnum
  # RansackEnum::Error
  class Error < StandardError; end

  class << self
    # @return [RansackEnum::Configuration]
    def config
      @config ||= Configuration.new
    end

    # @yieldparam config [RansackEnum::Configuration]
    # @yieldreturn [void]
    # @return [void]
    def configure
      raise Error, 'No block is given!' unless block_given?

      yield config
    end
  end
end
