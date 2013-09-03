Gem::Specification.new do |spec|
  spec.name        = 'sitemap_reader'
  spec.version     = '0.0.2'
  spec.summary     = "Ruby library for reading sitemaps"
  spec.authors     = ["Michal Pawlowski"]
  spec.email       = 'misza@misza.co.uk'

  spec.files       = ["lib/sitemap_reader.rb"]
  spec.require_paths = ["lib"]

  spec.homepage    = 'https://github.com/itsudo/sitemap_reader'
  spec.license     = 'MIT'

  spec.add_dependency "nokogiri"
  spec.add_dependency "w3c_datetime"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
