require './lib/loader'
require 'rubygems'
require 'terminal-table'
require 'csv'
require 'date'
require 'geocoder'
require 'erb'
require 'congress'
require 'pry'

class QueueHolder < Loader
  
  attr_accessor :client, :queue_district, 
                :found_district, :district, :queue_count, :queue_results, 
                :filename, :rows, :table, :table_printer, :exporter, :html_template
  
  HEADER_ROW = ["LAST NAME", "FIRST NAME", "EMAIL", "ZIPCODE", "CITY", "STATE", "ADDRESS", "PHONE", "DISTRICT"]
  CSV_HEADER_ROW = ["last_Name", "first_Name", "Email_Address", "HomePhone", "Street", "City", "State", "Zipcode"]
  
  
  def initialize
    @client = Congress::Client.new(File.read "./config/api_key.txt")
    @contents = nil
    @queue_results = []
    @district = district
  end
  
  def queue_count
    @queue_results.count 
  end
    
    
  def queue_clear
    @queue_results = []
  end
  
  def find_district
    queue_district if @queue_results.length < 11 
    no_districts_here if @queue_results.length > 10
  end
  
  def queue_district
      @queue_results.each do |att|
        found_district = @client.districts_locate(att.zipcode)[:results][0][:district]
        att.district = found_district
      end
  end
  
  def no_districts_here
    @queue_results.each do |row|
      row.district = "N/A"
    end
  end
    
  def queue_print(stuff=@queue_results)
    table = Terminal::Table.new 
    table.headings = [HEADER_ROW]
    table.title = "Queue Printout on #{Time.now.strftime("%d/%m/%Y at %H:%M")}"
      table.align_column(0..8, :left)
      queue_district if stuff.length < 11 
      no_districts_here if stuff.length > 10
      table.rows = stuff.map do |row|
        [row.last_name.capitalize, row.first_name.capitalize, row.email, row.zipcode, 
          row.city.split.map(&:capitalize).join(" "), row.state.upcase, row.street_address.split.map(&:capitalize).join(" "), row.phone_number, row.district]
      end
      puts table
  end
  
  def queue_print_by(attribute)
      sorted = @queue_results.sort_by do |row|
        row.send(attribute)
      end
      @queue_results = sorted
      queue_print(sorted)
  end
  
  def queue_print_to_csv(filename="QueueOutput.csv")
    CSV.open("#{filename}", 'w') do |csv|
      header_names = %w( last_name first_name email street_address city state zipcode phone_number district )
      csv << CSV_HEADER_ROW
      queue_district if @queue_results.length < 11 
      no_districts_here if @queue_results.length > 10
      @queue_results.each do |attendee|
        csv << header_names.collect { |header| attendee.send(header) }
      end
      puts "CSV file exported with the name #{filename}"
    end
  end
  
  def queue_export_html(filename="QueueOutput.html")
    Dir.mkdir("output") && (File.rename "./lib/stylesheet.css", "./output/stylesheet.css") unless Dir.exists? "output"
    export_name = "./output/#{filename}"
    queue_output_creator
    File.open(export_name, 'w') do |file|
      file.puts @queue_output
    end
    css_file_regenerator
  end
  
  def queue_output_creator
    file_template = File.read "./lib/table_template.html.erb"
    erb_template = ERB.new file_template
    exporter = erb_template.result(binding)
    @queue_output = exporter
  end
  
  def css_file_regenerator
    css_file = File.read "output/stylesheet.css"
    File.open("./lib/stylesheet.css", 'w') do |file|
      file.puts css_file
    end
  end
  
end
  