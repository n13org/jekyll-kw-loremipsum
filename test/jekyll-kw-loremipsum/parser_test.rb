# frozen_string_literal: true

require 'test_helper'
require 'jekyll-kw-loremipsum/configuration'
require 'jekyll-kw-loremipsum/parser'

module Jekyll
  module KargWare
    module LoremIpsum
      # Test the LoremIpsum-Parser
      class TestParser < Minitest::

        # def test_get_all_words
        #   all_words = Jekyll::KargWare::LoremIpsum::Parser.words_lorem_ipsum

        #   assert_equal 'Lorem ipsum dolor ...', all_words
        # end

        # def test_default_parser
        #   parser = Jekyll::KargWare::LoremIpsum::Parser.new

        #   # assert_equal 'sha384', parser.configuration.hash_type
        #   # assert_equal true, parser.configuration.write_source_mapping_url
        #   # assert_equal false, parser.configuration.create_tmpfile
        # end

        # def test_echo_default_config
        #   parser = Jekyll::KargWare::LoremIpsum::Parser.new

        #   assert_equal 'sha384', parser.echo_config
        # end

        def test_echo_config_only_words
          parser = Jekyll::KargWare::LoremIpsum::Parser.new("10w")

          assert_equal nil, parser.echo_config
        end

        def test_parser_one_non_random_word
          parser = Jekyll::KargWare::LoremIpsum::Parser.new("1w")

          assert_equal 'Lorem', parser.get_lorem_ipsum
        end

        def test_parser_two_non_random_words
          parser = Jekyll::KargWare::LoremIpsum::Parser.new("2w")

          assert_equal 'Lorem ipsum', parser.get_lorem_ipsum
        end

        def test_parser_four_paragraphs_three_non_random_words
          parser = Jekyll::KargWare::LoremIpsum::Parser.new("4p 3miw 3maw")

          # assert_equal 'Lorem ipsum dolor \n\n Lorem ipsum dolor \n\n Lorem ipsum dolor \n\n Lorem ipsum dolor', parser.get_lorem_ipsum
          assert_equal 'Lorem ipsum dolor' + "\n\n" + 'Lorem ipsum dolor' + "\n\n" + 'Lorem ipsum dolor' + "\n\n" + 'Lorem ipsum dolor', parser.get_lorem_ipsum
        end

      end
    end
  end
end
