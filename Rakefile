# frozen_string_literal: true

require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:lint) do |t|
  t.options = %w[--parallel]
end
namespace :lint do
  desc 'Lint fix (Rubocop)'
  task fix: :auto_correct
end

require 'yard'
desc 'document'
task :doc do
  YARD::CLI::CommandParser.run
end

task default: %i[lint spec]
