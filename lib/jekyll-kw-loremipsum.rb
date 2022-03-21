# frozen_string_literal: true

require 'jekyll-kw-loremipsum/configuration'
require 'jekyll-kw-loremipsum/parser'
require 'jekyll-kw-loremipsum/version'

module Jekyll
  module KargWare
    # LoremIpsum a Jekyll PlugIn inside `Jekyll::KargWare`
    module LoremIpsum
      class Error < StandardError; end
      class Exception < Gem::Exception; end

      module_function def get_plugin_config(context)
        if defined? context.registers[:site].config
          context.registers[:site].config[Jekyll::KargWare::LoremIpsum::RUBYGEM_NAME] || {}
        else
          {}
        end
      end

      # LoremIpsum tag {% kw_lorem_ipsum input %} for Jekyll
      class LoremIpsumTag < Liquid::Tag
        # safe true
        # priority :low

        def initialize(tag_name, input, tokens)
          super
          @input = input.to_s.strip
        end

        def render(context)
          parser = Jekyll::KargWare::LoremIpsum::Parser.new(
            Jekyll::KargWare::LoremIpsum.get_plugin_config(context)
          )

          # parser = Jekyll::KargWare::LoremIpsum::Parser.new(@input)
          parser.get_lorem_ipsum(@input)
        end
      end
    end
  end
end

Liquid::Template.register_tag(Jekyll::KargWare::LoremIpsum::JEKYLL_TAGNAME, Jekyll::KargWare::LoremIpsum::LoremIpsumTag)
