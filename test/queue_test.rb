require './test/test_helper'
require './lib/queue'

class QueueTest < Minitest::Test
  
  def test_queue_can_load_a_default_file
    q = Queue.new
    refute_equal nil, q.contents
  end
  
  
  
end