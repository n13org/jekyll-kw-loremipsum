require_relative 'lib/jekyll-kw-loremipsum/version'

Gem::Specification.new do |spec|
  spec.name          = Jekyll::KargWare::LoremIpsum::RUBYGEM_NAME
  spec.version       = Jekyll::KargWare::LoremIpsum::VERSION
  spec.authors       = ['Nicolas Karg', 'n13.org - Open-Source by KargWare']
  spec.email         = ["rubygems.org@n13.org"]
  spec.homepage      = "https://notes.n13.org/rubygems"
  spec.license       = 'MIT'

  spec.summary       = %q{LoremIpsum is a jekyll tag-plugin.}
  spec.description   = <<-LONGDESCRIPTION
    LoremIpsum is a jekyll plugin. The plugin can be used as a tag for jekyll. You can get some dummy text for your webpage, without copy & pasting the Lorem Ipsum words yourself.

    - Use the tag `{% kw_lorem_ipsum 30w %}` to get 30 different words.
    - Use the tag `{% kw_lorem_ipsum random 4p 7miw 12maw %}` to get 4 paragraphs between 7 and 12 words.
  LONGDESCRIPTION

  spec.metadata      = {
    'homepage_uri'    => 'https://github.com/n13org/jekyll-kw-loremipsum',
    'bug_tracker_uri' => 'https://github.com/n13org/jekyll-kw-loremipsum/issues',
    'source_code_uri' => 'https://github.com/n13org/jekyll-kw-loremipsum'
  }

  # spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  # spec.add_dependency 'jekyll', '~> 3.8'

  spec.required_ruby_version = '>= 2.5'
  spec.add_dependency 'jekyll', '>= 3.8', '<= 4.3.1'

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.files         = Dir[
                         'README.md', 'LICENSE', 'CHANGELOG.md',
                         'lib/**/*.rb'
                       ]
  spec.require_paths = ["lib"]
end
