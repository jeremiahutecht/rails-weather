class Forecast < ActiveRecord::Base
  validates :lat, format: { with: /\A-?([1-8]?\d(?:\.\d{1,})?|90(?:\.0{1,6})?)\z/, message: "-90 and +90 for the southern and northern hemisphere" }
  validates :lng, format: { with: /\A-?((?:1[0-7]|[1-9])?\d(?:\.\d{1,})?|180(?:\.0{1,})?)\z/, message: "-180 and +180 specifying the east-west position" }

  def get_weather_data
    ForecastIO.forecast(lat, lng)
  end
end
