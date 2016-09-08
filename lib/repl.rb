require './lib/queue'

class Repl
  
  attr_reader :loader, :queue, :help, :usable, :user_selection
  
  def initialize(filename="./event_attendees.csv")
    @loader = Loader.new(filename="event_attendees.csv")
    @queue = Queue.new
    @help = Help.new
    @user_selection = user_selection
  end
  
  usable = user_selection.split(" ")
  command = usable[0]
  
  if command == "hello"
    puts "Hello!"
  end
  
  if command == "queue"
    selection = usable[1]
    attribute = usable[-1]
    
    if selection == "count"
      queue_count
    elsif selection == "clear"
      queue_clear
    elsif selection == "district"
      queue_district
    elsif selection == "print" && attribute.nil?
      queue_print
    elsif selection == "print" && attribute.nil? == false
      queue_print_by(attribute)
    elsif selection == "save" && attribute == "*.csv"
      queue_save_to(filename=attribute)
    elsif selection == "export" && attribute == "*.html"
      queue_export_html(filename=attribute)
    else
      puts "I'm afraid I can't do that."
      puts "I hope your name isn't Dave."
      puts "But if it is..."
      puts "Well. Nevermind."
  end
  
  if command == "load"
    filename = usable[1]
    load_file(filename)
  end
  
  if command == "find"
    attribute = usable[1].to_s
    criteria = usable[2].to_s
    find(attribute, criteria)
  end
  
  if command == "help"
    @help
  end
  
  def load_file(filename="./event_attendees.csv")
    @loader.open_file(filename)
    @loader.attendee_collector
  end
  
  def find(attribute, criteria)
    @loader.find(attribute, criteria)
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
end