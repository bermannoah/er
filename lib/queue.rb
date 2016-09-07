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
    @contents = []
    @api_key = File.read "./config/api_key.txt"
    @client = Congress::Client.new(@api_key)
  end
  
  def count
    count = @queue_results.count
  end

end