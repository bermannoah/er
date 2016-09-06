gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start
require './lib/queue'
require 'csv'
require 'pry'

class QueueTest < Minitest::Test
  
  def test_queue_can_load_a_default_file
    q = Queue.new
    refute_equal nil, q.contents
  end
  
  
  
end