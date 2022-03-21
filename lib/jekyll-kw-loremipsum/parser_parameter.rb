# frozen_string_literal: true

module Jekyll
  module KargWare
    module LoremIpsum
      # Parameters for parser class
      class ParserParameter
        attr_reader :words, :paras, :minw, :maxw, :random

        def initialize
          super

          # 1w    ==  1 word (default 40)
          @words = 40
          # 3p    ==  3 paragraphs (default 1)
          # 7miw  ==  7 Min words in para (default 40)
          # 15maw == 15 Max words in para (default 40)
          @paras = 1
          @minw = 40
          @maxw = 40
          # random == Should the words be random (or ordered) (default false)
          @random = false
        end

        def init(parameters = nil)
          return if parameters.nil?

          # TODO: Min > Max --> Warning
          # TODO: unkown words, e.g. "p, word, min, max" --> Warning

          matched_words = parameters.strip.match(/\d+w/)
          matched_paras = parameters.strip.match(/\d+p/)
          matched_minw = parameters.strip.match(/\d+miw/)
          matched_maxw = parameters.strip.match(/\d+maw/)
          matched_random = parameters.strip.match(/random/)

          # puts "Parser: W: %s P: %s MiW: %s MaW: %s Random: $s" % [matched_words, matched_paras, matched_minw, matched_maxw, matched_random]

          @words = matched_words[0].strip.sub('w', '').to_i if matched_words
          @paras = matched_paras[0].strip.sub('p', '').to_i if matched_paras
          @minw = matched_minw[0].strip.sub('miw', '').to_i if matched_minw
          @maxw = matched_maxw[0].strip.sub('maw', '').to_i if matched_maxw
          @random = true if matched_random
        end

        def to_str_random
          @random ? 'random' : 'sorted'
        end

        def use_words
          @paras.nil? || @paras == 1
        end

        def use_paragraphs
          !use_words
        end

        def to_s
          if use_words
            format(
              'W: %<amount_words>04d (%<random_or_sorted>s)',
              amount_words: @words,
              random_or_sorted: to_str_random
            )
          else
            format(
              'P: %<amount_paragraphs>04d (%<random_or_sorted>s) MiW: %<min_per_paragraph>04d MaW: %<max_per_paragraph>04d',
              amount_paragraphs: @paras,
              random_or_sorted: to_str_random,
              min_per_paragraph: @minw,
              max_per_paragraph: @maxw
            )
          end
        end
      end
    end
  end
end
