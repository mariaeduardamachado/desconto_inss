Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'registrations'}

  root to: 'proponents#index'

  resources :proponents do
    get 'report', on: :collection
    patch 'update_salary', on: :member
  end

end
