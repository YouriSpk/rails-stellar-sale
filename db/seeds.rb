# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# require "open-uri"
# require 'json'
require 'uri'
require 'net/http'
require 'json'

url = URI("https://api.api-ninjas.com/v1/stars?min_distance_light_year=25&name=b")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["X-Api-Key"] = "cAApfZJ3W8AxYJ/4g01QUQ==AWo8XyIMXo7CEUTN"

response = http.request(request)
data = JSON.parse(response.body)
if data
  puts "Removing all stars....."
  Star.destroy_all
  puts "Seeding new data....."
  data.each do |item|
    puts item
    Star.create(initial_name: "#{item['name']}, #{item['constellation']}",
                distance_from_earth_in_light_years: item["distance_light_year"],
                spectral_class: item["spectral_class"],
                user_id: 1,
                price: 50)
  end
  puts "Seeding finished, #{Star.count} stars are created"
end

# file = URI.open("https://api.api-ninjas.com/v1/stars?min_distance_light_year=1",
#                 "X-Api-Key" => ENV['NINJA_API_KEY'])
# puts JSON.parse(file)
