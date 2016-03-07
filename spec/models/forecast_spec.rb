require "rails_helper"

describe Forecast do
  it "valid with a lat and lng" do
    forecast = Forecast.new(
      lat: "48.8567",
      lng: "2.3508")
    expect(forecast).to be_valid
  end

  it "is invalid without a lat" do
    forecast = Forecast.new(lat: nil)
    forecast.valid?
    expect(forecast.errors[:lat]).not_to include("can't be blank")
  end

  it "it invalid without a lng" do
    forecast = Forecast.new(lng: nil)
    forecast.valid?
    expect(forecast.errors[:lng]).not_to include("can't be blank")
  end
end
