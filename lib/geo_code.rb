require "httparty"

class GeoCode
  include HTTParty
  base_uri "https://maps.googleapis.com/maps/api/geocode/"
  debug_output

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
    self.get(url)["results"]
  end

  def self.assign_values(location_hash)
    postcode_response = location_hash.parsed_response["results"]["formatted_address"]["geometry"].first
    self.lat = postcode_response["geometry"]["lat"]
    self.lng = postcode_response["geometry"]["lng"]
    self.location = postcode_response["formatted_address"]
  end
end
