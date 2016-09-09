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
    l.find("first_name", "Allison")
    assert_equal 16, l.queue_results.count
  end
  
  def test_loader_can_find_by_last_name
    l = Loader.new
    l.open_file
    l.attendee_collector
    l.find("last_name", "Nguyen")
    assert_equal 3, l.queue_results.count
  end
  
  def test_loader_can_find_by_email_address
    l = Loader.new
    l.open_file
    l.attendee_collector
    l.find("email", "arannon@jumpstartlab.com")
    assert_equal "allison", l.queue_results[0].first_name
  end  
  
  def test_loader_can_find_by_street_address
    l = Loader.new
    l.open_file
    l.attendee_collector 
    l.find("street_address", "3155 19th St NW" )
    assert_equal "3155 19th st nw", l.queue_results[0].street_address
  end
  
  def test_loader_can_find_by_city
    l = Loader.new
    l.open_file
    l.attendee_collector 
    l.find("city", "Washington" )
    assert_equal "washington", l.queue_results[0].city
  end
  
  def test_loader_can_find_by_state
    l = Loader.new
    l.open_file
    l.attendee_collector 
    l.find("state", "DC" )
    assert_equal "dc", l.queue_results[0].state
  end
  
  def test_loader_can_find_by_zipcode
    l = Loader.new
    l.open_file
    l.attendee_collector 
    l.find("zipcode", "20010" )
    assert_equal "20010", l.queue_results[0].zipcode
  end
  
  def test_loader_does_not_do_duplicates
    l = Loader.new
    l.open_file
    l.attendee_collector
    l.find("first_name", "Allison")
    l.find("first_name", "Allison")
    assert_equal 16, l.queue_results.count
  end
  
  def test_loader_can_pull_multiple_things_but_not_dupes
    l = Loader.new
    l.open_file
    l.attendee_collector 
    l.find("zipcode", "98122" )
    l.find("zipcode", "98122" )
    assert_equal 8, l.queue_results.count
  end
  
  def test_loader_does_not_add_dupes_with_different_find_calls
    l = Loader.new
    l.open_file
    l.attendee_collector
    l.find("first_name", "Allison")
    l.find("zipcode", "20010")
    assert_equal 5, l.queue_results.count
  end
  
  def test_loader_returns_error_message_if_it_cannot_find_a_thing
    l = Loader.new
    l.open_file
    l.attendee_collector
    assert_equal "first_name: Zuul not found. Sorry about that!", l.find("first_name", "Zuul")
  end
  
  def test_loader_sets_queue_results_to_empty_array_if_nothing_found
    l = Loader.new
    l.open_file('./small_event_attendees.csv')
    l.attendee_collector
    l.find("zipcode", "99999")
    assert_equal [], l.queue_results
  end
  
  def test_loader_is_case_insensitive
    l = Loader.new
    l.open_file('./small_event_attendees.csv')
    l.attendee_collector
    l.find("first_name", "aLliSoN")
    assert_equal "allison", l.queue_results[0].first_name
    l.find("last_name", "nGuYen")
    assert_equal "nguyen", l.queue_results[0].last_name
  end
  
  def test_loader_is_case_insensitive_with_states_and_cities
    l = Loader.new
    l.open_file('./small_event_attendees.csv')
    l.attendee_collector
    l.find("state", "cA")
    assert_equal 3, l.queue_results.count
    l.find("city", "SeAtTle")
    assert_equal 2, l.queue_results.count
  end
  
  def test_loader_returns_an_empty_array_if_there_is_no_data
    l = Loader.new
    l.find("zipcode", "63105")
    assert_equal [], l.data
    assert_equal [], l.queue_results
  end
  
  
    
  
end