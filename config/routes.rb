Rails.application.routes.draw do
  devise_for :users
  devise_scope :users do
      get '/users', to: redirect("/users/sign_up")
    end
  root to: "posts#index"
  resources :posts do
    resources :comments, only: :create
  end
 

end
