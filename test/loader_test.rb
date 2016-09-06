gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require './lib/loader'
require 'csv'
require 'congress'
require 'pry'

class LoaderTest < Minitest::Test
  
  def test_loader_can_open_a_file
    l = Loader.new
    l.open_file
    refute_equal nil, l.contents
  end
  
  def test_loader_has_an_api_key
    l = Loader.new
    tester = File.read "./config/api_key.txt"
    assert_equal tester, l.api_key
  end
  
  def test_loader_can_access_api
    l = Loader.new
    tester = l.client.legislators_locate('63105')
    name = tester[:results][0].first_name
    assert_equal true, name.include?("Ann")
  end
  
  def test_loader_can_find_last_names
    l = Loader.new

  end
    
  
end