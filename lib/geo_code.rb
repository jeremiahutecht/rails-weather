require "httparty"

class GeoCode
  include HTTParty
  base_uri "https://maps.googleapis.com/maps/api/geocode/"

  cattr_accessor :lat, :lng, :location

  def initialize
    location_hash = postal_code
    assign_values(location_hash)
  end

# TODO: This works in development but needs to be done better
  def self.api_key
    Rails.application.secrets.google_geocode_key
  end

  def self.postal_code(postal)
    url = "/json?address=#{postal}&key=#{api_key}"
    self.get(url)["results"].first
  end

  def self.assign_values(location_hash)
    parsed_response = JSON.parse(location_hash.to_json)
    puts "parsed_response: #{parsed_response.inspect}"
    postcode_response = JSON.parse(location_hash.to_json)["geometry"]
    puts "postcode_response: #{postcode_response.inspect}"
    self.lat = postcode_response["location"]["lat"]
    self.lng = postcode_response["location"]["lng"]

    puts "self.lat: #{self.lat.inspect}"
    puts "self.lng: #{self.lng.inspect}"
    puts "self.location: #{self.location.inspect}"
    # postcode_response = location_hash.parsed_response["results"]["formatted_address"]["geometry"].first
    # self.lat = postcode_response["geometry"]["lat"]
    # self.lng = postcode_response["geometry"]["lng"]
    # self.location = postcode_response["formatted_address"]
  end
end
