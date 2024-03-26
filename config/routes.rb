Rails.application.routes.draw do

  root "proponents#index"

  resources :proponents do
    get 'report', on: :collection
    patch 'update_salary', on: :member
  end

  devise_for :users, skip: [:registrations], controllers: {registrations: 'users/registrations'}
  get "up" => "rails/health#show", as: :rails_health_check

end
