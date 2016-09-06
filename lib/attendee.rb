require './lib/cleaner'

class Attendee < Cleaner
  
  def initialize(row)
    @first_name = clean_first_name(row[:first_name])
    @last_name = clean_last_name(row[:last_name])
    @email = row[:email_address]
    @street_address = row[:street_address]
    @city = row[:city]
    @state = row[:state]
    @zipcode = cleaner.clean_zipcode(row[:zipcode])
    @phone_number = cleaner.clean_phone_number(row[:homephone])
  end

end