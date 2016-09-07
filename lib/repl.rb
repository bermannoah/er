# require './event_reporter'
# require 'pry'
# 
# class Repl
#   
#   puts "Hello and welcome to Event Reporter, for all your event reporting needs."
#   puts "If you're not sure what to do, enter 'help'."
# 
#   user_selection = ""
#   repl = Repl.new
#   loop do 
#     print "Enter command > "
#     user_selection = gets.chomp
#     choice = repl(user_selection)
#     break if choice == "quit" 
#     puts choice unless choice == "quit"
#   end
# 
#   puts "Thanks for using Event Reporter! Bye now."
#     
#   
# end