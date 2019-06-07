require 'minitest/autorun'
require_relative 'parser'

class ParserTest < Minitest::Test
  def setup
    @parser = Parser.new("/help_page/1 126.318.035.031
/help_page/1 126.318.035.032
/help_page/1 126.318.035.033
/help_page/1 126.318.035.034
/help_page/1 126.318.035.035
/contact 184.123.665.061
/contact 184.123.665.062
/contact 184.123.665.063
/contact 184.123.665.063
/index 444.701.448.104
/index 444.701.448.104
/index 444.701.448.104
/index 444.701.448.104
/index 444.701.448.104
/index 444.701.448.104
/index 444.701.448.104
/index1 444.701.448.555
")
  end

  def test_parser_visit_count
    assert_equal 17, @parser.visits
    assert_equal 10, @parser.unique_visits
  end

  def test_return_pages_view_wise_most_to_least
   expected = "/index 7
/help_page/1 5
/contact 4
/index1 1
"
     
   assert_equal expected, @parser.pages_most_viewed
     
  end

  def test_return_pages_unique_view_wise_most_to_least
    expected = "/help_page/1 5
/contact 3
/index 1
/index1 1
"
    assert_equal expected, @parser.pages_most_unique_viewed
  end
end
