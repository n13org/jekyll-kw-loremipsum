require_relative 'lib/jekyll-kw-loremipsum/version'

Gem::Specification.new do |spec|
  spec.name          = Jekyll::KargWare::LoremIpsum::RUBYGEM_NAME
  spec.version       = Jekyll::KargWare::LoremIpsum::VERSION
  spec.authors       = ['Nicolas Karg', 'n13.org - Open-Source by KargWare']
  spec.email         = ["rubygems.org@n13.org"]
  spec.homepage      = "https://notes.n13.org/rubygems"

  spec.summary       = %q{LoremIpsum is a jekyll plugin.}
  spec.description   = <<-LONGDESCRIPTION
    LoremIpsum is a jekyll plugin. Generated from a GitHub Template.
  LONGDESCRIPTION

  spec.metadata      = {
    'homepage_uri'    => spec.homepage,
    'bug_tracker_uri' => 'https://github.com/n13org/jekyll-plugin-template/issues',
    'source_code_uri' => 'https://github.com/n13org/jekyll-plugin-template'
  }

  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  spec.add_dependency 'jekyll', '>= 3.8'

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.files         = Dir[
                         'README.md', 'LICENSE', 'CHANGELOG.md',
                         'lib/**/*.rb'
                       ]
  spec.require_paths = ["lib"]
end
