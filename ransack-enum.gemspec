# frozen_string_literal: true

require_relative 'lib/ransack_enum/version'

Gem::Specification.new do |spec|
  spec.name          = 'ransack-enum'
  spec.version       = RansackEnum::VERSION
  spec.authors       = %w[shoma07]
  spec.email         = %w[23730734+shoma07@users.noreply.github.com]

  spec.summary       = 'Enable enum values in Ransack search'
  spec.description   = 'Enable enum values in Ransack search'
  spec.homepage      = 'https://github.com/shoma07/ransack-enum'
  spec.license = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/v#{spec.version}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]
  spec.metadata = { 'rubygems_mfa_required' => 'true' }
end
