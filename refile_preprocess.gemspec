$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "refile_preprocess/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "refile_preprocess"
  s.version     = RefilePreprocess::VERSION
  s.authors     = ["hamada.syougo"]
  s.email       = ["hamada.syougo@mountposition.co.jp"]
  s.homepage    = "https://github.com/mountposition/refile-preprocess"
  s.summary     = "This plugin is create preprocessed file on upload time."
  s.description = "This plugin is create preprocessed file on upload time.You can omit the execution time of the process process at the time of browsing."
  s.license     = "MIT"

  s.files = `git ls-files lib README.md`.split($/).reject { |f| f.include?("test") }
end
