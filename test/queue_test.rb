require './test/test_helper'
require './lib/queue'

class QueueHolderTest < Minitest::Test
  
  def test_queue_has_an_api_key
    q = QueueHolder.new
    tester = File.read "./config/api_key.txt"
    assert_equal tester, q.client.key
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
    q.find("zipcode", "63105")
    assert_equal 12, q.queue_count
  end
  
  def test_queue_can_clear_itself
    q = QueueHolder.new
    q.open_file
    q.attendee_collector
    q.find("zipcode", "20010")
    assert_equal 5, q.queue_count
    q.queue_clear
    assert_equal 0, q.queue_count
  end

  def test_if_less_than_ten_entries_queue_looks_for_district
    q = QueueHolder.new
    q.open_file
    q.attendee_collector
    q.find("zipcode", "20010")
    assert_equal 5, q.queue_count
    q.find_district
    assert_equal 0, q.queue_results[0].district
  end
  
  def test_if_more_than_ten_entries_queue_will_not_look_for_districts
    q = QueueHolder.new
    q.open_file
    q.attendee_collector
    q.find("first_name", "Allison")
    assert_equal 16, q.queue_count
    q.find_district
    assert_equal "N/A", q.queue_results[0].district
  end
  
end