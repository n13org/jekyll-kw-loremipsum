# frozen_string_literal: true

require 'jekyll-kw-loremipsum/parser_parameter'

module Jekyll
  module KargWare
    module LoremIpsum
      # LoremIpsum parser class
      class Parser
        attr_reader :config

        # https://loremipsum.de/downloads/original.txt
        @@words_lorem_ipsum = 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, At accusam aliquyam diam diam dolore dolores duo eirmod eos erat, et nonumy sed tempor et et invidunt justo labore Stet clita ea et gubergren, kasd magna no rebum. sanctus sea sed takimata ut vero voluptua. est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.'
        # @@words_lorem_ipsum = "Lorem ipsum dolor sit amet, consetetur sadipscing"

        @@arr_words_lorem_ipsum = nil
        def self.arr_words_lorem_ipsum
          @@arr_words_lorem_ipsum = @@words_lorem_ipsum.split(' ') if @@arr_words_lorem_ipsum.nil?
          @@arr_words_lorem_ipsum
        end

        def self.get_words(cnt, random = false)
          arr_part = if random
                       arr_words_lorem_ipsum.sample(cnt)
                     else
                       arr_words_lorem_ipsum.slice(0, cnt)
                     end

          arr_part.join(' ').chomp(',')
        end

        def self.create_parameters(input)
          parameters = ParserParameter.new
          parameters.init(input)
          parameters
        end

        def initialize(options = {})
          @config = Jekyll::KargWare::LoremIpsum::Configuration.new(options)
        end

        # TODO: Fucntion "get_lorem_ipsum" should be parse
        def get_lorem_ipsum(input)
          parameters = Jekyll::KargWare::LoremIpsum::Parser.create_parameters(input)

          if parameters.use_words
            Jekyll::KargWare::LoremIpsum::Parser.get_words(parameters.words, parameters.random)
          else
            arr_oneliner = []
            for i in 1..parameters.paras
              r = rand(parameters.minw..parameters.maxw)
              arr_oneliner += [Jekyll::KargWare::LoremIpsum::Parser.get_words(r, parameters.random)]
            end
            # arr_oneliner.join("\n") # No line wrap
            # arr_oneliner.join("<br>") # OK, but no 2nd p
            # arr_oneliner.join("  ") # No line wrap
            # arr_oneliner.join("  \n")
            arr_oneliner.join("\n\n")
            # arr_oneliner.join(" - ")
          end
        end
      end
    end
  end
end

## FOR TESTING #############################
## ruby ./lib/jekyll-kw-loremipsum/parser.rb
## #########################################

# Jekyll::KargWare::LoremIpsum::Parser.new("1w").echo_config
# Jekyll::KargWare::LoremIpsum::Parser.new("2w").echo_config
# Jekyll::KargWare::LoremIpsum::Parser.new("3w").echo_config
# Jekyll::KargWare::LoremIpsum::Parser.new("34w").echo_config
# Jekyll::KargWare::LoremIpsum::Parser.new("foo bar 75w hello 115w foo bar").echo_config
# Jekyll::KargWare::LoremIpsum::Parser.new("hello 13p foo 9p bar 56p").echo_config
# Jekyll::KargWare::LoremIpsum::Parser.new("1 w").echo_config
# Jekyll::KargWare::LoremIpsum::Parser.new("foo 8w bar 3p hello 7miw 25maw foo bar").echo_config
# puts "######################"

# for i in 1..Jekyll::KargWare::LoremIpsum::Parser.arr_words_lorem_ipsum.size
#   puts "%03d: %s" % [i, Jekyll::KargWare::LoremIpsum::Parser.get_words(i)]
# end
# puts "######################"

# puts "%03d: %s" % [650, Jekyll::KargWare::LoremIpsum::Parser.get_words(651)]
# puts "%03d: %s" % [1000, Jekyll::KargWare::LoremIpsum::Parser.get_words(1000)]

# cw = Jekyll::KargWare::LoremIpsum::Parser.new("7w")
# # cw = Jekyll::KargWare::LoremIpsum::Parser.new("8w")
# cw.echo_config
# puts cw.get_lorem_ipsum
# puts "######################"

# c3p = Jekyll::KargWare::LoremIpsum::Parser.new("5p 8miw 8maw")
# c3p.echo_config
# puts c3p.get_lorem_ipsum
# puts "######################"

# c3p = Jekyll::KargWare::LoremIpsum::Parser.new("5p 7miw 25maw")
# c3p.echo_config
# c3p.get_lorem_ipsum
# puts "######################"

# cr = Jekyll::KargWare::LoremIpsum::Parser.new("random 5p 8miw 8maw")
# cr.echo_config
# puts cr.get_lorem_ipsum
# puts "######################"
