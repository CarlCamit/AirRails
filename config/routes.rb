Rails.application.routes.draw do
  devise_for :users
  resources :listings do
    resources :conversations do
      resources :messages
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'listings#index'
  get '/support' => 'support#new'
  post '/support' => 'support#create'

end
