Rails.application.routes.draw do
  resources :forecasts

  resources :geo_codes

  root "forecasts#index"
end
