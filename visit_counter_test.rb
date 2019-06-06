require 'minitest/autorun'
require_relative 'visit_counter'

class VisitCounterTest < Minitest::Test
  def setup
    @counter = VisitCounter.new
  end

  def test_visit_counter_can_be_updated
    @counter.update("/path", "ip")
  end

  def test_visit_counter_returns_proper_values_at_start
    assert_equal @counter.visits, 0
    assert_equal @counter.unique_visits, 0
  end

  def test_visit_counter_registeres_single_ip_visit
    @counter.update("/path", "0.0.0.0")
    assert_equal @counter.visits, 1
    assert_equal @counter.unique_visits, 1
  end
end
