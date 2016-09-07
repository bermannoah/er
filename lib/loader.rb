require './lib/attendee'
require 'rubygems'
require 'csv'
require 'geocoder'
require 'congress'
require 'pry'

class Loader

  attr_reader :api_key, :client, :collector
  attr_accessor :contents, :data
  
  def initialize(filename="./event_attendees.csv")
    @api_key = File.read "./config/api_key.txt"
    @client = Congress::Client.new(@api_key)
    @data = []
    @contents = CSV.open filename, headers: true, header_converters: :symbol
  end

  def open_file(filename="./event_attendees.csv")
    @contents = CSV.open filename, headers: true, header_converters: :symbol
  end
  
  def collector
    @data = @contents.map do |row|
      Attendee.new(row)
    end
    @data
  end
  
end