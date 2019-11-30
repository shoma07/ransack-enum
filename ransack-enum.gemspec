lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ransack/enum/version"

Gem::Specification.new do |spec|
  spec.name          = "ransack-enum"
  spec.version       = Ransack::Enum::VERSION
  spec.authors       = ["shoma07"]
  spec.email         = ["23730734+shoma07@users.noreply.github.com"]

  spec.summary       = "Allow Enum values to be used in Ransack searches"
  spec.description   = "Allow Enum values to be used in Ransack searches"
  spec.homepage      = "https://github.com/shoma07/ransack-enum"
  spec.required_ruby_version = ">= 2.3"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/shoma07/ransack-enum/blob/v#{spec.version}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "ransack", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sqlite3", "~> 1.4"
end
