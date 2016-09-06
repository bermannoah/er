require 'csv'
require 'pry'

class Generator
  
    CSV.open(filename="./results.csv", "w") do |csv|
      csv << ["headers"]
      csv << ["data"]
    end
  
  
end