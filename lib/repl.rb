# require './lib/help'
require './lib/queue'

class Repl
  
  attr_accessor :user_selection, :command, :selection
  attr_reader :loader, :queue, :help, :usable
  
  def initialize
    @loader = Loader.new(filename="event_attendees.csv")
    @queue = QueueHolder.new
    # @help = Help.new
    @user_selection = "here is a string"
  end
  
  

  
  def run

    puts "Hello and welcome to Event Reporter, for all your event reporting needs."
    puts "If you're not sure what to do, enter 'help'."
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
        load_command(selection)
      end
      
      # if command == "queue"
      #   
      #   if selection == "count"
      #     puts @queue.queue_count
      #   elsif selection == "clear"
      #     @queue.queue_clear
      #   elsif selection == "district"
      #     @queue.queue_district
      #   elsif selection == "print" && attribute.nil?
      #     @queue.queue_print
      #   elsif selection == "print" && attribute.nil? == false
      #     @queue.queue_print_by(attribute)
      #   elsif selection == "save" && attribute == "*.csv"
      #     @queue.queue_save_to(filename=attribute)
      #   elsif selection == "export" && attribute == "*.html"
      #     @queue.queue_export_html(filename=attribute)
      #   else
      #     puts "I'm afraid I can't do that."
      # end
      # 
      # if command == "load"
      #   filename = usable[1]
      #   @loader.open_file
      #   @loader.attendee_collector
      # end
      # 
      # if command == "find"
      #   attribute = usable[1].to_s
      #   criteria = usable[2].to_s
      #   @loader.find(attribute, criteria)
      # end
      # 
      # if command == "help"
      #   @help
      # end

      
    end


  end
  
  def queue_commands(selection, attribute)
    case selection
    when "count"
      puts @queue.queue_count
    when "clear"
      puts @queue.queue_clear 
    end
    
  end
  
  
  
  def load_command(filename)
    filename = filename || "./event_attendees.csv"
    @loader.open_file(filename)
    @loader.attendee_collector
  end
  
  def find(attribute, criteria)
    @loader.find(attribute, criteria)
  end
  
  def queue_count
    puts @queue.queue_count
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


r = Repl.new
r.run