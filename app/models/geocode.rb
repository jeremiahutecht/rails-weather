class GeoCode
  include HTTParty

  base_uri 'maps.googleapis.com/maps/api/'

  # Currently limited this zip, there is lots more that could be used
  # attr_accessor :zip, :lat, :lng

  def initialize(zip, lat, lng)
    self.zip = zip
    self.lat = lat
    self.lng = lng
  end

  def api_key
    Rails.application.secrets.google_geocode_key
  end

  def self.find(zip)
    response = get("geocode/json?address=#{zip}&key=#{api_key}")
    if response.success?
      self.new(response["lat"],["lng"])
    else
      raise response.response
    end
  end
end
