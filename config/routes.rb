Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
    resources :sellers, only: [:create, :show, :destroy]
    resources :categories do
      resources :items
    end
  end
end

end
