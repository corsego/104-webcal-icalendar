Rails.application.routes.draw do
  resources :games do
    member do
      post :invite
    end
  end
  root to: redirect('/games')
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
