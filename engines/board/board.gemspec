$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "board/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "board"
  s.version     = Board::VERSION
  s.authors     = ["Baylor Rae'"]
  s.email       = ["baylor@thecodedeli.com"]
  s.homepage    = "https://github.com/BaylorRae/message_board"
  s.summary     = "https://github.com/BaylorRae/message_board"
  s.description = "https://github.com/BaylorRae/message_board"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.8"

  s.add_development_dependency "pg"
end
