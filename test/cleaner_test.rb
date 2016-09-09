require './test/test_helper'
require './lib/cleaner'


class CleanerTest < Minitest::Test
  
  def test_cleaner_can_clean_a_first_name
    c = Cleaner.new
    assert_equal "bob", c.clean_first_name("          Bob")
    assert_equal "bob", c.clean_first_name("   Bob             ")
  end
  
  def test_cleaner_can_clean_a_last_name
    c = Cleaner.new
    assert_equal "jenkins", c.clean_last_name("Jenkins          ")
    assert_equal "jenkins", c.clean_last_name("                   Jenkins          ")
  end
  
  def test_cleaner_can_clean_a_zip_code
    c = Cleaner.new
    assert_equal "00123", c.clean_zipcode(123)
  end
  
  def test_cleaner_can_handle_a_phone_number_that_is_too_long
    c = Cleaner.new
    assert_equal "Bad number entry.", c.clean_phone_number("4237840384701740834")
  end
  
  def test_cleaner_can_handle_a_phone_number_that_is_too_long_and_starts_with_a_one
    c = Cleaner.new
    assert_equal 5558675309, c.clean_phone_number("15558675309")
  end
  
  def test_cleaner_can_handle_a_phone_number_that_is_too_long_and_does_not_start_with_a_one
    c = Cleaner.new
    assert_equal "Bad number entry.", c.clean_phone_number("48151623421")
  end
  
  def test_cleaner_can_handle_a_number_that_is_too_short
    c = Cleaner.new
    assert_equal "Bad number entry.", c.clean_phone_number("4815")
  end
  
  def test_cleaner_can_handle_a_number_that_is_just_right_but_has_special_chars
    c = Cleaner.new
    assert_equal 5555555555, c.clean_phone_number("(555) 555 5555")
  end
  
  def test_cleaner_can_clean_a_state
    c = Cleaner.new
    assert_equal "mo", c.clean_state("Mo")
  end

  
    

end