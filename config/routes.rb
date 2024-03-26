Rails.application.routes.draw do

  root to: 'proponents#index'

  resources :proponents do
    get 'report', on: :collection
    patch 'update_salary', on: :member
  end

  devise_for :users, controllers: {registrations: 'users/registrations'}
end
