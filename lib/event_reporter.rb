require './lib/repl'

class EventReporter
  
  attr_accessor :user_selection, :repl
  
  def initialize
    @repl = Repl.new(user_selection)
  end
  
  puts "Hello and welcome to Event Reporter, for all your event reporting needs."
  puts "If you're not sure what to do, enter 'help'."
  print "Enter command: "

  while user_selection != "quit"
    
    
    
    
  end
    
  





    # 
    # loop do 
    #   user_selection = gets.chomp
    #   choice ||= Repl.new(user_selection) 
    #   break if choice == "quit" 
    #   puts choice unless choice == "quit"
    # end

    puts "Thanks for using Event Reporter! Bye now."
    exit
end