require './lib/cleaner'
require 'rubygems'
require 'csv'
require 'geocoder'
require 'congress'
require 'pry'

class Queue(filename="./event_attendees.csv")

  def initialize(filename="./event_attendees.csv")
    @contents = Loader.new(filename).contents
  end

  
  
end