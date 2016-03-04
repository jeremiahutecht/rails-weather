json.array!(@forecasts) do |forecast|
  json.extract! forecast, :id
  json.url forecast_url(forecast, format: :json)
end
