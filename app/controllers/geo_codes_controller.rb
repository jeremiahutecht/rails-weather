class GeoCodesController < ApplicationController

  def create
    @geocode = GeoCode.new(geo_code_params)

    reponds_to json
    @geocode.lat_lng
  end

  private

  def geo_code_params
    params.require(:geo_code).permit(
    :postal
    )
  end
end
