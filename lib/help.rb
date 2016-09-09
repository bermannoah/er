require 'pry'

class Help
  
  attr_accessor :user_selection, :topic, :selection, :queue_helper, :load_helper, :find_helper, :help_list, :exit_message
  
  def initialize
    @user_selection = "string"
  end

def run

  puts " "
  puts "---"
  puts "Enter 'help' to see a list of commands."
  puts "Enter 'help' followed by the command name to bring up help for that command."
  puts "Enter 'exit' to exit and return to the main menu."
  puts "---"
  puts " "

  until @user_selection == "exit"
    print "Enter command: "
    @user_selection = gets.chomp
    usable = @user_selection.split(" ")
    topic = usable[0]
    selection = usable[1]
    case topic
      when "queue"
        puts queue_helper(selection)
      when "load"
        puts load_helper
      when "find"
        puts find_helper
      when "help"
        puts help_list
      when "exit"
        puts exit_message
      end
  end
end
  
  def help_list
    puts " "
    puts "---"
    puts "Here is a list of commands: "
    puts "load"
    puts "queue count"
    puts "queue clear"
    puts "queue district"
    puts "queue print"
    puts "queue print by"
    puts "queue save to"
    puts "queue export html"
    puts "find"
    puts "---"
    puts " "
  end
  
  def load_helper
    puts " "
    puts "---"
    puts "This will erase any already loaded data."
    puts "If you don't specify a file, it will load the default..."
    puts "...which in this case is 'event_attendees.csv'."
    puts "You can specify a file by typing load <filepath>"
    puts "---"
    puts " "
  end
  
  def find_helper
    puts " "
    puts "---"
    puts "This loads the queue with all records matching the criteria for the given attribute."
    puts "For example, 'find zipcode 20011' will print all records with a zipcode of 20011."
    puts "You can use the following attributes:"
    puts "last_name, first_name, email, zipcode, city, state, address, phone_number"      
    puts "---"
    puts " "
  end
  
  def queue_helper(selection)
    case selection
    # when nil
    #   puts " "
    #   puts "---"
    #   puts "Queue has many associated commands, please specify."
    #   puts "Type 'help' with no command to see a list of all commands."
    #   puts "---"
    #   puts " "
    when "count"
      puts " "
      puts "---"
      puts "This will output the number of records currently in queue."
      puts "---"
      puts " "
    when "clear"
      puts " "
      puts "---"
      puts "This will empty the queue."
      puts "---"
      puts " "
    when "district"
      puts " "
      puts "---"
      puts "If there are less than 10 entries, this will"
      puts "reach out to the Sunlight API to find district"
      puts "info for each entry."      
      puts "---"
      puts " "
    when "print"
      puts " "
      puts "---"
      puts "This will print out a tab-delimited table with"
      puts "the information from the queue."
      puts "---"
      puts " "
    when "print", "by"
      puts " "
      puts "---"
      puts "This will print data sorted by a particular attribute."
      puts "For example: 'queue print by zipcode' will sort data by zipcode."
      puts "---"
      puts " "
    when "save", "to"
      puts " "
      puts "---"
      puts "This will export the current queue to a CSV."
      puts "Enter a filename after 'to', otherwise it will use 'results.csv'"
      puts "---"
      puts " "
    when "export", "html"
      puts " "
      puts "---"
      puts "This will export the current queue to a valid HTML file."
      puts "Enter a filename after 'html', otherwise it will use 'results.html'."
      puts "---"
      puts " "
    end
  end
      
      
  def exit_message
    puts " "
    puts "---"
    puts "Okay, goodbye."
    puts "---"
    puts " "
  end
    
end
