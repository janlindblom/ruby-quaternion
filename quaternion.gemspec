
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "quaternion"

Gem::Specification.new do |spec|
  spec.name          = "quaternion"
  spec.version       = Quaternion::VERSION
  spec.authors       = ["Jan Lindblom"]
  spec.email         = ["janlindblom@fastmail.fm"]

  spec.summary       = %q{Quaternions in Ruby.}
  spec.homepage      = "https://github.com/janlindblom/ruby-quaternion"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/janlindblom/ruby-quaternion/tree/master'
  spec.metadata['changelog_uri'] = 'https://github.com/janlindblom/ruby-quaternion/blob/master/CHANGELOG.md'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features|.github)/})
      f == ".travis.yml" ||
      f == ".gitignore" ||
      f == ".editorconfig" ||
      f == ".rspec" ||
      f == "bitbucket-pipelines.yml" ||
      f == ".rubocop.yml" ||
      f == ".rubocop_todo.yml"
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 2"
  spec.add_development_dependency "rake", "~> 13"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "rubocop", "~> 1"
  spec.add_development_dependency "yard", "~> 0.9"
  spec.add_development_dependency "pry", "~> 0.14"
end
