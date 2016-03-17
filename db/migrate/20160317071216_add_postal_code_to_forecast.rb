class AddPostalCodeToForecast < ActiveRecord::Migration
  def change
    add_column :forecasts, :postal_code, :string
  end
end
