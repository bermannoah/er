require './test/test_helper'
require './lib/queue'

class QueueHolderTest < Minitest::Test
  
  def test_queue_has_an_api_key
    q = QueueHolder.new
    tester = File.read "./config/api_key.txt"
    assert_equal tester, q.api_key
  end
  
  def test_queue_can_access_api
    q = QueueHolder.new
    tester = q.client.legislators_locate('63105')
    name = tester[:results][0].first_name
    assert_equal true, name.include?("Ann")
  end
  
  def test_queue_can_count_number_of_items
    q = QueueHolder.new
    q.open_file
    q.attendee_collector
    q.find("zipcode", "98122")
    assert_equal 2, q.queue_results[0].count
  end
  
  def test_queue_can_clear_itself
    q = QueueHolder.new
    q.open_file
    q.attendee_collector
    q.find("zipcode", "20010")
    assert_equal 1, q.queue_results[0].count
    q.clear
    assert_equal 0, q.queue_results[0].count
  end

  def test_if_less_than_ten_entries_queue_looks_for_district
    q = QueueHolder.new
    q.open_file
    q.attendee_collector
    q.find("zipcode", "20010")
    assert_equal 1, q.queue_results[0].count
    q.district
    binding.pry
    assert_equal 0, q.queue_results.district
  end
end