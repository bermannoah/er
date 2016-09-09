require './lib/cleaner'

class Attendee
  
  attr_accessor :first_name, :last_name, :email, :street_address, :city, :state, :zipcode, :phone_number, :district
  
  def initialize(row=nil)
    cleaner = Cleaner.new
    @first_name = cleaner.clean_first_name(row[:first_name])
    @last_name = cleaner.clean_last_name(row[:last_name])
    @email = cleaner.clean_email(row[:email_address])
    @street_address = cleaner.clean_street(row[:street])
    @city = cleaner.clean_city(row[:city])
    @state = cleaner.clean_state(row[:state])
    @zipcode = cleaner.clean_zipcode(row[:zipcode])
    @phone_number = cleaner.clean_phone_number(row[:homephone])
    @district = nil
  end

end