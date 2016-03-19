class GeoCode
  include HTTParty
  base_uri "https://maps.googleapis.com/maps/api/geocode/"

  attr_accessor :lat, :lng, :location, :postal

  def initialize(hash)
    self.postal = hash["postal"]
  end

# TODO: This works in development but needs to be done better
  def api_key
    Rails.application.secrets.google_geocode_key
  end

  def postal_code
    url = "/json?address=#{@postal}&key=#{api_key}"
    gets(url)["results"].first
  end

  def assign_values(location_hash)
    postcode_response = JSON.parse(location_hash.to_json)["geometry"]
    lat = postcode_response["location"]["lat"]
    lng = postcode_response["location"]["lng"]

    puts "lat: #{lat.inspect}"
    puts "lng: #{lng.inspect}"
  end

  def lat_lng
    assign_values(postal_code)
  end
end
