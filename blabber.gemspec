Gem::Specification.new do |s|
  s.name        = 'blabber'
  s.version     = '0.1.4'
  s.date        = '2013-07-15'
  s.summary     = "Redirect console messages to other places!"
  s.description = "Redirect console messages to other places."
  s.authors     = ["Paul Picazo"]
  s.email       = 'ppicazo@gmail.com'
  s.files       = ["lib/blabber.rb", "lib/blabber/campfire.rb", "lib/blabber/email.rb"]
  s.homepage    = 'https://github.com/ppicazo/blabber'
  s.license     = 'New BSD License'
  s.add_dependency('broach', ["~> 0.3.0"])
end
