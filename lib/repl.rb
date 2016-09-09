require './lib/queue'
require './lib/help'


class Repl
  
  attr_accessor :user_selection, :command, :selection
  attr_reader :loader, :queue, :help, :usable
  
  def initialize
    @loader = Loader.new(filename="event_attendees.csv")
    @queue = QueueHolder.new
    @user_selection = "here is a string"
  end

  def run

    puts "Hello and welcome to Event Reporter, for all your event reporting needs."
    puts "If you're not sure what to do, enter 'help'."
    puts "To quit, simply enter 'quit'."
    until @user_selection == "quit"
      print "Enter command: "
      @user_selection = gets.chomp
      usable = @user_selection.split(" ")
      command = usable[0]
      selection = usable[1]
      attribute = usable[-1]        
      case command
      when "queue"
        queue_commands(selection, attribute)
      when "load"
        load_commands(selection)
      when "find"
        find_commands(selection, attribute)
      when "help"
        help_commands(selection)
      end
    end
    
  end
  
  def queue_commands(selection, attribute)
    case selection
    when "count"
      puts @queue.queue_count
    when "clear"
      puts @queue.queue_clear 
    when "district"
      puts @queue.queue_district
    when "print"
      puts @queue.queue_print
    when "print", "by"
      puts @queue.queue_print_by(attribute)
    when "save", "to"
      puts @queue.queue_print_to_csv(attribute)
    when "export", "html"
      puts @queue.queue_export_html(attribute)
    else
      puts "Incorrect input."
    end
    
  end
  
  def load_commands(filename)
    filename = filename || "./event_attendees.csv"
    @queue.open_file(filename)
    @queue.attendee_collector
    puts "Loaded #{filename}."
  end
  
  def find_commands(attribute, criteria)
    @queue.find(attribute, criteria)
    puts "Found #{queue.queue_results.count} records."
  end
  
  def help_commands(attribute)
    h = Help.new
    h.run
  end
  
  
end


r = Repl.new
r.run