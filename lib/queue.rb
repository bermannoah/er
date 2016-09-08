require './lib/loader'
require 'rubygems'
require 'terminal-table'
require 'csv'
require 'date'
require 'geocoder'
require 'congress'
require 'pry'

class QueueHolder < Loader
  
  attr_accessor :queue, :api_key, :client, :found_district, :queue_count, :queue_results, :rows
  
  HEADER_ROW = ["LAST NAME", "FIRST NAME", "EMAIL", "ZIPCODE", "CITY", "STATE", "ADDRESS", "PHONE"]
  
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
    rows << [@queue_results[0].last_name, @queue_results[0].first_name, @queue_results[0].email, @queue_results[0].zipcode, @queue_results[0].city, @queue_results[0].state, @queue_results[0].street_address, @queue_results[0].phone_number]
    table = Terminal::Table.new
    table.align_column(0..7, :left)
    table.title = "Queue Printout on #{Time.now.strftime("%d/%m/%Y at %H:%M")}"
    table.headings = [HEADER_ROW]
    table.rows = rows
    puts table
    
  end
  
  
  
  
  
  

end