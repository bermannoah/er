require './lib/loader'
require 'pry'

class Cleaner
  
  attr_reader :loader, :contents, :first_name, :last_name, :zipcode, :cleaned_number, :cleaned_first_name, :cleaned_last_name
  
  def initialize(filename="event_attendees.csv")
    @loader = Loader.new
    @contents = loader.open_file(filename)
  end
  
  def clean_first_name(first_name)
    first_name = first_name.strip
    first_name
  end
  
  def clean_last_name(last_name)
    last_name = last_name.strip
    last_name
  end
  
  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

  def clean_number(number)
    cleaned_number = number.gsub(/[^0-9A-Za-z]/, '').to_s
    if cleaned_number.length > 11
      return "Bad number entry."
    elsif cleaned_number[0] == "1" && cleaned_number.length == 11
      cleaned_number = cleaned_number[1..-1].to_i
    elsif cleaned_number[0] != "1" && cleaned_number.length == 11
      return "Bad number entry."
    elsif cleaned_number.length < 10
      return "Bad number entry."
    else
      cleaned_number.to_i
    end
    cleaned_number.to_i
  end
  
end