require './test/test_helper'
require './lib/attendee'
require './lib/loader'

class AttendeeTest < Minitest::Test
  
  
  
  def test_attendee_has_a_first_name
    a = Attendee.new( { :first_name => "Allison",
                        :last_name => "Nguyen",
                        :zipcode => 12345,
                        :homephone => "6154385000"
                                                } )
    assert_equal "Allison", a.first_name
    assert true
  end
  
  def test_attendee_has_a_last_name
    a = Attendee.new( { :first_name => "Allison",
                        :last_name => "Nguyen",
                        :zipcode => 12345,
                        :homephone => "6154385000"
                                                } )
    assert_equal "Nguyen", a.last_name
  end
  
  def test_attendee_has_an_email_address
    l = Loader.new
    l.open_file
    l.collector
    assert_equal "arannon@jumpstartlab.com", l.data[0].email
  end
  
  def test_attendee_has_a_street_address
    l = Loader.new
    l.open_file
    l.collector
    assert_equal "3155 19th St NW", l.data[0].street_address
  end
  
  def test_attendee_has_a_city
    l = Loader.new
    l.open_file
    l.collector
    assert_equal "Washington", l.data[0].city
  end
  
  def test_attendee_has_a_state
    l = Loader.new
    l.open_file
    l.collector
    assert_equal "DC", l.data[0].state
  end
  
  def test_attendee_has_a_phone_number
    l = Loader.new
    l.open_file
    l.collector
    assert_equal 6154385000, l.data[0].phone_number
  end
  
end