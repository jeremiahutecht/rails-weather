require 'httparty'

class GeoCode
  include HTTParty
  base_uri "maps.googleapis.com"
  default_timeout 15 # 15 second hard timeout

  def api_key
    Rails.application.secrets.google_geocode_key
  end

  def base_path
    "/maps/api/geocode/"
  end

  def timeout_handler
    begin
      yield
    rescue Net::OpenTimeout, Net::ReadTimeout
      {}
    end
  end

  def postal_code(postal, options = {})
    handle_timeouts do
      url = "#{base_path}json?address=#{postal}&key=#{api_key}"
      self.class.get(url, options)["results"]["geometry"]["location"]["lat"]["lng"]
    end
  end
end
