gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require './lib/cleaner'
require 'csv'
require 'pry'

class CleanerTest < Minitest::Test
  
  def test_cleaner_can_open_file
    c = Cleaner.new
    refute_equal nil, c.contents
  end
  
  def test_cleaner_can_clean_a_first_name
    c = Cleaner.new
    assert_equal "Bob", c.clean_first_name("          Bob")
    assert_equal "Bob", c.clean_first_name("   Bob             ")
  end
  
  def test_cleaner_can_clean_a_last_name
    c = Cleaner.new
    assert_equal "Jenkins", c.clean_last_name("Jenkins          ")
    assert_equal "Jenkins", c.clean_last_name("                   Jenkins          ")
  end
  
  def test_cleaner_can_clean_a_zip_code
    c = Cleaner.new
    assert_equal "00123", c.clean_zipcode(123)
  end
  
  def test_cleaner_can_clean_a_phone_number
    c = Cleaner.new
    assert_equal "Bad number entry.", c.clean_number("")

end