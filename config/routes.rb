Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  resources :first_app_posts

  get "up" => "rails/health#show", as: :rails_health_check


#  get "/first_app_posts/new", to: "first_app_posts#new", as: :new_first_app_post
#   get "/first_app_posts/:id", to: "first_app_posts#show", as: :first_app_post
#   patch "/first_app_posts/:id", to: "first_app_posts#update"
#  delete "/first_app_posts/:id", to: "first_app_posts#destroy"
#  get "/first_app_posts/:id/edit", to: "first_app_posts#edit", as: :edit_first_app_post
#  post "/first_app_post", to: "first_app_posts#create", as: :first_app_posts

  # Defines the root path route ("/")
  root "first_app_posts#index"
end
