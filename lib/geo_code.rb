require 'httparty'

class GeoCode
  include HTTParty
  base_uri "maps.googleapis.com/maps/api/geocode/"
  default_timeout 15 # 15 second hard timeout

# TODO: This works in development but needs to be done better
  def api_key
    Rails.application.secrets.google_geocode_key
  end


  def timeout_handler
    begin
      yield
    rescue Net::OpenTimeout, Net::ReadTimeout
      {}
    end
  end

  def postal_code(postal)
    timeout_handler do
      url = "json?address=#{postal}&key=#{api_key}"
      self.class.get(url, options)["results"]["geometry"]["location"]["lat"]["lng"]
    end
  end
end
