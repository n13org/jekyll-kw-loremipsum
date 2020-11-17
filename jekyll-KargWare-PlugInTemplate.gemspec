require_relative 'lib/jekyll/KargWare/PlugInTemplate/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-KargWare-PlugInTemplate"
  spec.version       = Jekyll::KargWare::PlugInTemplate::VERSION
  spec.authors       = ['Nicolas Karg', 'n13.org - Open-Source by KargWare']
  spec.email         = ["rubygems.org@n13.org"]

  spec.summary       = %q{A template project for jekyll plugins.}
  spec.description   = %q{A template project for jekyll plugins with some additional content}
  spec.homepage      = "https://kargware.com"

  spec.metadata      = {
    'homepage_uri'    => spec.homepage
    'bug_tracker_uri' => 'https://github.com/n13org/jekyll-plugin-template/issues',
    'source_code_uri' => 'https://github.com/n13org/jekyll-plugin-template'
  }

  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]
end
