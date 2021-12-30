# frozen_string_literal: true

require 'active_support/core_ext'
require_relative 'ransack_enum/version'
require_relative 'ransack_enum/configuration'
require_relative 'ransack_enum/formatter'
require_relative 'ransack_enum/adapters'
require 'active_record'
require 'ransack'

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
