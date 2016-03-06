require "httparty"
require "pp"

class GeoCode
  include HTTParty
  base_uri "maps.googleapis.com/maps/api/geocode/"

# TODO: This works in development but needs to be done better
  def self.api_key
    Rails.application.secrets.google_geocode_key
  end

  def self.postal_code(postal, options = {})
    url = "json?address=#{postal}&key=#{api_key}"
    GeoCode.get(url, options)
  end
end
