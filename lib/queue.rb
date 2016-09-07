require './lib/loader'
require 'rubygems'
require 'csv'
require 'geocoder'
require 'congress'
require 'pry'

class QueueHolder < Loader
  
  attr_accessor :queue, :api_key, :client
  
  HEADER_ROW = ["LAST NAME", "FIRST NAME", "EMAIL", "ZIPCODE", "CITY", "STATE", "ADDRESS", "PHONE", "DISTRICT" ]
  
  def initialize
    @api_key = File.read "./config/api_key.txt"
    @client = Congress::Client.new(@api_key)
    @data = []
    @contents = nil
    @queue_results = []
  end
  
  def count
      count = @queue_results.count 
  end
  
  # what do I do if I don't want to run a search first? can I start over from prev queue?
  
  def clear
    @queue_results = [[]]
  end
  
  def district
    if @queue_results[0].count < 10
      found_district = @client.districts_locate(queue_results[0][0].zipcode)
      @queue_results[0] << found_district
    else
      "Sorry, too many entries."
    end
  end
  
  
  

end