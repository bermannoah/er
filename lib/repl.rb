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
    until @user_selection == "quit" || @user_selection == "exit"
      print "Enter command: "
      @user_selection = gets.chomp
      @usable = @user_selection.split(" ")
      command = usable[0]
      selection = usable[1]
      criteria = usable[-1]
  
      case command
      when "queue"
        queue_commands(selection, criteria)
      when "load"
        load_commands(selection)
      when "find"
        find_commands
      when "help"
        help_commands
      end
    end
    
    puts "Thanks for using Event Reporter. Event report with us again soon."
    
  end
  
  def queue_commands(selection, criteria)
    case selection
    when "count"
      puts @queue.queue_count
    when "clear"
      puts @queue.queue_clear 
      puts "The queue has been cleared."
    when "district"
      puts @queue.queue_district
    when "print", "by"
      puts @queue.queue_print_by(criteria)
    when "save", "to"
      puts @queue.queue_print_to_csv(criteria)
    when "export", "html"
      puts @queue.queue_export_html(criteria)
    when "print"
      puts @queue.queue_print
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
  
  def find_commands
    @queue.find(usable[1], usable[2..-1].join(" "))
    puts "Found #{queue.queue_results.count} records."
  end
  
  def help_commands
    h = Help.new
    h.run
  end

  
end

r = Repl.new
r.run