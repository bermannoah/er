require 'pry'

class Cleaner
  
  def clean_first_name(first_name)
    first_name = first_name.strip.downcase
    first_name
  end
  
  def clean_last_name(last_name)
    last_name = last_name.strip.downcase
    last_name
  end
  
  def clean_state(state)
    state = state.to_s.downcase
    state
  end
  
  def clean_email(email)
    email = email.to_s.downcase
    email
  end
  
  def clean_street(street_address)
    street_address = street_address.to_s.downcase
    street_address
  end
  
  
  def clean_city(city)
    state = city.to_s.downcase
    state
  end
  
  def clean_state(state)
    state = state.to_s.downcase
    state
  end
  
  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

  def clean_phone_number(number)
    cleaned_number = number.gsub(/[^0-9A-Za-z]/, '').to_s
    if cleaned_number.length > 11 || cleaned_number.length < 10 || cleaned_number[0] != "1" && cleaned_number.length == 11
      return "Bad number entry."
    elsif cleaned_number[0] == "1" && cleaned_number.length == 11
      cleaned_number = cleaned_number[1..-1].to_i
    else 
      cleaned_number.to_i
    end
    cleaned_number.to_i
  end

end