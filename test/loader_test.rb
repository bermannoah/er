require './test/test_helper'
require './lib/loader'

class LoaderTest < Minitest::Test
  
  def test_loader_can_open_a_file
    l = Loader.new
    l.open_file
    refute_equal nil, l.contents
  end
  
  def test_loader_can_find_by_first_name
    l = Loader.new
    l.open_file
    l.attendee_collector
    l.find("first_name", "allison")
    assert_equal 1, l.queue_results.count
  end
  
  def test_loader_can_find_by_last_name
    l = Loader.new
    l.open_file
    l.attendee_collector
    l.find("last_name", "nguyen")
    assert_equal 1, l.queue_results.count
  end
  
  def test_loader_can_find_by_email_address
    l = Loader.new
    l.open_file
    l.attendee_collector
    l.find("email", "arannon@jumpstartlab.com")
    assert_equal "Allison", l.queue_results[0][0].first_name
  end  
  
  def test_loader_can_find_by_street_address
    l = Loader.new
    l.open_file
    l.attendee_collector 
    l.find("street_address", "3155 19th St NW" )
    assert_equal "3155 19th St NW", l.queue_results[0][0].street_address
  end
  
  def test_loader_can_find_by_city
    l = Loader.new
    l.open_file
    l.attendee_collector 
    l.find("city", "Washington" )
    assert_equal "Washington", l.queue_results[0][0].city
  end
  
  def test_loader_can_find_by_state
    l = Loader.new
    l.open_file
    l.attendee_collector 
    l.find("state", "DC" )
    assert_equal "DC", l.queue_results[0][0].state
  end
  
  def test_laoder_can_find_by_zipcode
    l = Loader.new
    l.open_file
    l.attendee_collector 
    l.find("zipcode", "20010" )
    assert_equal "20010", l.queue_results[0][0].zipcode
  end
  
  def test_loader_can_find_by_phone_number
    l = Loader.new
    l.open_file
    l.attendee_collector
    l.find("phone_number", 6154385000)
    assert_equal 6154385000, l.queue_results[0][0].phone_number
  end
  
  
end