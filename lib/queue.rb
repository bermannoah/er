require './lib/loader'
require 'rubygems'
require 'csv'
require 'geocoder'
require 'congress'
require 'pry'

class QueueHolder
  
  attr_accessor :queue
  HEADER_ROW = ["LAST NAME", "FIRST NAME", "EMAIL", ]
  
  def initialize
    @contents = []
  end
  
  def instructions(command)
    return puts
  
  # starts as empty array
  
  # load 
  
  
end