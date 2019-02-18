
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "quaternion"

Gem::Specification.new do |spec|
  spec.name          = "quaternion"
  spec.version       = Quaternion::VERSION
  spec.authors       = ["Jan Lindblom"]
  spec.email         = ["janlindblom@fastmail.fm"]

  spec.summary       = %q{Number system extending complex numbers.}
  spec.homepage      = "https://bitbucket.org/janlindblom/ruby-quaternion"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.58"
  spec.add_development_dependency "yard", "~> 0.9"
  spec.add_development_dependency "pry", "~> 0.11"
end
