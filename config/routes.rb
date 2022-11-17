Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'

  resources :rooms, except: [:edit] do
  end

end
