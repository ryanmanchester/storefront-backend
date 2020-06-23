Rails.application.routes.draw do
  post '/api/v1/sellers/login', to: 'api/v1/sessions#create'
  post '/api/v1/sellers/signup', to: 'api/v1/sellers#create'
  delete '/api/v1/sellers/logout', to: 'api/v1/sessions#destroy'
  get '/api/v1/sellers/get_current_seller', to: 'api/v1/sessions#get_current_seller'
  namespace :api do
    namespace :v1 do
    resources :sellers, only: [:create, :show, :destroy]
    resources :categories do
      resources :items
    end
  end
end

end
