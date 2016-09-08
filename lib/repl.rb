require './lib/loader'
require './lib/attendee'
require './lib/queue'


class Repl(user_selection)
  
  attr_reader :loader, :queue, :help
  
  def initialize
    @loader = Loader.new
    @queue = Queue.new
    @help = Help.new
  end
  
  user_selection = gets.chomp
  
  def load(filename="./event_attendees.csv")
    loader.open_file(filename)
    l.attendee_collector
  end
  
  def find(attribute, criteria)
    loader.find(attribute, criteria)
  end
  
  def queue_count
    @queue.queue_count
  end
  
  def queue_clear
    @queue.queue_clear
  end
  
  def queue_district
    @queue.queue_district
  end
  
  def queue_print
    @queue.queue_print
  end
  
  def queue_print_by(attribute)
    @queue.queue_print_by(attribute)
  end
  
  def queue_save_to(filename)
    @queue.queue_save_to(filename)
  end
  
  def queue_export_html(filename)
    @queue.queue_export_html(filename)
  end
  
end