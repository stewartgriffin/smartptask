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
    assert_equal 1, @counter.visits
    assert_equal 1, @counter.unique_visits
  end

  def test_visit_counter_registers_multiple_visits_of_same_ip_on_same_page
    5.times do
      @counter.update("/path", "0.0.0.0")
    end
    assert_equal 5, @counter.visits
    assert_equal 1, @counter.unique_visits
  end

  def test_visit_counter_registers_multiple_paths_from_same_ip

  end
end
