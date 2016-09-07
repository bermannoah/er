require './lib/loader'
require 'rubygems'
require 'terminal-table'
require 'csv'
require 'geocoder'
require 'congress'
require 'pry'

class QueueHolder < Loader
  
  attr_accessor :queue, :api_key, :client, :found_district, :queue_count, :rows
  
  HEADER_ROW = ["LAST NAME", "FIRST NAME", "EMAIL", "ZIPCODE", "CITY", "STATE", "ADDRESS", "PHONE", "DISTRICT" ]
  
  def initialize
    @api_key = File.read "./config/api_key.txt"
    @client = Congress::Client.new(@api_key)
    @data = []
    @contents = nil
    @queue_results = []
  end
  
  def all_entries(filename="./event_attendees.csv")
    l = Loader.new
    l.open_file
    @queue_results = l.attendee_collector
  end
  
  def queue_count
      queue_count = @queue_results.count 
  end
    
  def queue_clear
    @queue_results = []
  end
  
  def queue_district
    if @queue_results.count < 10
      found_district = @client.districts_locate(queue_results[0].zipcode)[:results][0][:district].to_s
      found_district
      return "District is #{found_district}"
    else
      "Sorry, too many entries."
    end
  end
  
  def queue_print
    rows = []
    rows << @queue_results[last_name]
    table = Terminal::Table.new :title => "Queue Printout", :headings => HEADER_ROW, :rows => rows
      
    puts table
    
  end
  
  
  
  
  
  

end