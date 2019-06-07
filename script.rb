require_relative 'parser'

log_file = File.open("WEBSERVER.LOG", "r")

parser = Parser.new(log_file)

puts "Pages with non unique views count"
puts parser.pages_most_viewed
puts "\n"

puts "Pages with unique views count"
puts parser.pages_most_unique_viewed
