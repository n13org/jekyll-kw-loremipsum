# frozen_string_literal: true

require 'test_helper'

require 'jekyll'
require 'jekyll-kw-loremipsum'

module Jekyll
  module KargWare
    module LoremIpsum
      class LoremIpsumTagTest < Minitest::Test
        include Liquid

        def test_tag_name
          assert_equal 'kw_lorem_ipsum', Jekyll::KargWare::LoremIpsum::JEKYLL_TAGNAME
        end

        def setup
          @stubbed_context = Struct.new(:registers)
          @stubbed_context_site = Struct.new(:config)
          @stubbed_context_page = Struct.new(:content)
        end

        # def test_constructor
        #   # tag_name, text, tokens
        #   tag = Jekyll::KargWare::LoremIpsum::LoremIpsumTag.new(
        #     Jekyll::KargWare::LoremIpsum::JEKYLL_TAGNAME,
        #     '2w',
        #     Liquid::Tokenizer.new('')
        #   )
        #   assert_equal 'Lorem ipsum', tag.render
        # end

        def test_tag_two_words
          default_plugin_config = {
          }

          context = @stubbed_context.new(
            site: @stubbed_context_site.new(default_plugin_config)
          )

          tag = LoremIpsumTag.parse(
            Jekyll::KargWare::LoremIpsum::JEKYLL_TAGNAME,
            '2w',
            Liquid::Tokenizer.new(''),
            Liquid::ParseContext.new
          )

          assert_equal('Lorem ipsum', tag.render(context))
        end

        def test_tag_three_paragraphs
          default_plugin_config = {
          }

          context = @stubbed_context.new(
            site: @stubbed_context_site.new(default_plugin_config)
          )

          tag = LoremIpsumTag.parse(
            Jekyll::KargWare::LoremIpsum::JEKYLL_TAGNAME,
            '4p 3miw 3maw',
            Liquid::Tokenizer.new(''),
            Liquid::ParseContext.new
          )

          assert_equal('Lorem ipsum dolor' + "\n\n" + 'Lorem ipsum dolor' + "\n\n" + 'Lorem ipsum dolor' + "\n\n" + 'Lorem ipsum dolor', tag.render(context))
        end
      end
    end
  end
end
