Rails.application.routes.draw do

  root 'cars#index'

  resources :cars, except: [ :index ]
end
