Rails.application.routes.draw do
  resources :proponents
  root "proponents#index"

  resources :proponents do
    collection do
      get 'salary_report'
    end
  end

  devise_for :users, skip: [:registrations]
  get "up" => "rails/health#show", as: :rails_health_check

end
