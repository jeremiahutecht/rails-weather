Rails.application.routes.draw do
  resources :forecasts

  root "forecasts#index"
end
