Gem::Specification.new do |s|
  s.name        = 'paperclip-tinify'
  s.version     = '0.0.1'
  s.date        = '2016-09-23'
  s.summary     = "Compress Paperclip attachments using Tinyfy API"
  s.description = "JPEG and PNG compression for Paperclip gem"
  s.authors     = ["Thales Pereira"]
  s.email       = 'thalesfp@gmail.com'
  s.files       = ["lib/paperclip-tinify.rb"]
  s.homepage    = 'https://github.com/thalesfp/paperclip-tinify'
  s.license     = 'MIT'

  s.add_dependency 'tinify', '~> 1.3'
end