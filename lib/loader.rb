require 'csv'
require 'pry'

class Loader

  attr_accessor :contents

  def open_file(filename="./event_attendees.csv")
    @contents = CSV.open filename, headers: true, header_converters: :symbol
  end

end