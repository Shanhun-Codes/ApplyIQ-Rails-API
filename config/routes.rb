Rails.application.routes.draw do
  resources :job_applications do
    resource :resume, only: [ :create, :update, :show, :destroy ]
  end
  devise_for :users,
    defaults: { format: :json },
    controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations"
    }# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
# Can be used by load balancers and uptime monitors to verify that the app is live.


resources :users, only: [ :show, :update ] do
  resources :resumes, only: [ :index, :create, :show, :destroy ]
end

delete "/users/logout", to: "users/sessions#destroy"

get "users", to: "users#index"


  # Defines the root path route ("/")
  # root "posts#index"
end
