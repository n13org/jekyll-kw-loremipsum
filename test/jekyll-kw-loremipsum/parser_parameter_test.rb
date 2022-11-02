# frozen_string_literal: true

require_relative '../test_helper'
require 'jekyll-kw-loremipsum/parser_parameter'

module Jekyll
  module KargWare
    module LoremIpsum
      class ParserParameterTest < Minitest::Test
        def test_ctor_default
          sut = ParserParameter.new

          assert_equal 40, sut.words
          assert_equal 1, sut.paras
          assert_equal 40, sut.minw
          assert_equal 40, sut.maxw
          assert_equal false, sut.random

          assert_equal 'W: 0040 (sorted)', sut.to_s
        end

        def test_ctor_argument_error
          assert_raises ArgumentError do
            ParserParameter.new('40w')
          end
        end

        def test_ctor_init_nil
          sut = ParserParameter.new
          sut.init(nil)

          assert_equal 40, sut.words
          assert_equal 1, sut.paras
          assert_equal 40, sut.minw
          assert_equal 40, sut.maxw
          assert_equal false, sut.random

          assert_equal 'W: 0040 (sorted)', sut.to_s
        end

        def test_ctor_with_init_25w
          sut = ParserParameter.new
          sut.init('25w')

          assert_equal 25, sut.words
          assert_equal 1, sut.paras
          assert_equal 40, sut.minw
          assert_equal 40, sut.maxw
          assert_equal false, sut.random

          assert_equal 'W: 0025 (sorted)', sut.to_s
        end

        def test_ctor_with_init_2p_5miw_13maw_random
          sut = ParserParameter.new
          sut.init('2p 5miw 13maw random')

          assert_equal 40, sut.words
          assert_equal 2, sut.paras
          assert_equal 5, sut.minw
          assert_equal 13, sut.maxw
          assert_equal true, sut.random

          assert_equal 'P: 0002 (random) MiW: 0005 MaW: 0013', sut.to_s
        end

        def test_usage_of_words
          sut = ParserParameter.new
          sut.init('25w')

          assert_equal true, sut.use_words
          assert_equal false, sut.use_paragraphs
        end

        def test_usage_of_paragraphs
          sut = ParserParameter.new
          sut.init('4p')

          assert_equal false, sut.use_words
          assert_equal true, sut.use_paragraphs
        end
      end
    end
  end
end
