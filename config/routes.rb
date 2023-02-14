Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', :passwords => 'users/passwords' }
  
  devise_scope :user do
    authenticated :user do
      root 'sales#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  root 'devise/sessions#new'

  resource :sales, only: [:index] do
    post '/import', on: :collection, to: 'sales#import'
  end

  get '/', to: 'sales#index', as: :sales_index
end
