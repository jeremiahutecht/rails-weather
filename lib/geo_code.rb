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
    postcode_response = JSON.parse(location_hash.to_json)["geometry"]
    self.lat = postcode_response["location"]["lat"]
    self.lng = postcode_response["location"]["lng"]

    puts "self.lat: #{self.lat.inspect}"
    puts "self.lng: #{self.lng.inspect}"

  end
end
