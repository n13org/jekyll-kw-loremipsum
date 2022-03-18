# frozen_string_literal: true

module Jekyll
  module KargWare
    module LoremIpsum
      class Error < StandardError; end
      class Exception < Gem::Exception; end

      class LoremIpsumTag < Liquid::Tag
        # safe true
        # priority :low

        def initialize(tag_name, text, tokens)
          super
          @text = text.strip
          tokens = tokens

          @parser = Jekyll::KargWare::LoremIpsum::Parser.new(@text)
          # @parser.echo_config
        end

        def render(context)
          @parser.get_lorem_ipsum
        end
      end
    end
  end
end

Liquid::Template.register_tag('kw_lorem_ipsum', Jekyll::KargWare::LoremIpsum::LoremIpsumTag)