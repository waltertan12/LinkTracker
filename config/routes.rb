Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#index"

  namespace :api, defaults: {format: :json} do
    namespace :v1, defaults: {format: :json} do
      resources :sessions, only: [         :create, :destroy ]
      resources :invites,  only: [ :index, :create, :destroy ]

      resources :users,    except: [ :new, :edit ]
    end
  end
end
