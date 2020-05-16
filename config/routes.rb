Rails.application.routes.draw do
  post '/api/v1/sellers/login', to: 'api/v1/sessions#create'
  namespace :api do
    namespace :v1 do
    resources :sellers, only: [:create, :show, :destroy]
    resources :categories do
      resources :items
    end
  end
end

end
