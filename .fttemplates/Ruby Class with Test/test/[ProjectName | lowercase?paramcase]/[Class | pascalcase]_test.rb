# frozen_string_literal: true

require_relative '../test_helper'

module Jekyll
  module <Company | pascalcase>
    module <Project | pascalcase>
      class <Class | pascalcase>Test < Minitest::Test
        def test_fail_always
          assert false
        end
      end
    end
  end
end
