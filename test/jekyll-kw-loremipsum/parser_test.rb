# frozen_string_literal: true

require 'test_helper'
require 'jekyll-kw-loremipsum/configuration'
require 'jekyll-kw-loremipsum/parser'

module Jekyll
  module KargWare
    module LoremIpsum
      # Test the LoremIpsum-Parser
      class TestParser < Minitest::Test
        def test_match_parameters_seven_words
          sut = Jekyll::KargWare::LoremIpsum::Parser.create_parameters('7w')

          assert_equal true, sut.use_words
          assert_equal 7, sut.words
        end

        def test_match_parameters_three_paragraphs
          sut = Jekyll::KargWare::LoremIpsum::Parser.create_parameters('3p')

          assert_equal true, sut.use_paragraphs
          assert_equal 3, sut.paras
          assert_equal 40, sut.minw
          assert_equal 40, sut.maxw
        end

        def test_match_parameters_four_paragraphs_random_min_max
          sut = Jekyll::KargWare::LoremIpsum::Parser.create_parameters('4p 12miw 37maw')

          assert_equal true, sut.use_paragraphs
          assert_equal 4, sut.paras
          assert_equal 12, sut.minw
          assert_equal 37, sut.maxw
        end

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

        def test_empty_constructor
          sut = Jekyll::KargWare::LoremIpsum::Parser.new

          assert_equal 1, sut.config.my_integer
          assert_equal 2.4, sut.config.my_float
          assert_equal true, sut.config.my_boolean
          assert_equal 'foo bar', sut.config.my_string
        end

        def test_parser_one_non_random_word
          parser = Jekyll::KargWare::LoremIpsum::Parser.new

          assert_equal 'Lorem', parser.get_lorem_ipsum('1w')
        end

        def test_parser_two_non_random_words
          parser = Jekyll::KargWare::LoremIpsum::Parser.new

          assert_equal 'Lorem ipsum', parser.get_lorem_ipsum('2w')
        end

        def test_parser_four_paragraphs_three_non_random_words
          parser = Jekyll::KargWare::LoremIpsum::Parser.new

          delimiter = "\n\n"

          # assert_equal 'Lorem ipsum dolor \n\n Lorem ipsum dolor \n\n Lorem ipsum dolor \n\n Lorem ipsum dolor', parser.get_lorem_ipsum
          assert_equal "Lorem ipsum dolor#{delimiter}Lorem ipsum dolor#{delimiter}Lorem ipsum dolor#{delimiter}Lorem ipsum dolor", parser.get_lorem_ipsum('4p 3miw 3maw')
        end
      end
    end
  end
end
