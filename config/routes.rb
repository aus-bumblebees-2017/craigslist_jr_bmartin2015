Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :categories, only: [:index] do
    resources :articles, except: [:edit]
  end

  resources :users, only: [:show, :create, :new]

  get '/categories/:category_id/articles/:id/edit/:code', to: 'articles#edit', as: 'edit_category_article'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'session', to: 'sessions#inspect'

  root 'categories#index'
end
