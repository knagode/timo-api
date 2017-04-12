Rails.application.routes.draw do

  namespace :api, defaults: {format: :json}  do
    namespace :v1 do
      resources :transactions, only: [:index, :create, :show, :update, :destroy] do
        resources :bank_guarantees, only: [:index, :create, :show, :update]
      end
    end
  end

end
