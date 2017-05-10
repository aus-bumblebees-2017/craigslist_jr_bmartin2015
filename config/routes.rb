Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :categories, only: [:index] do
  #   resources :articles, except: [:edit]
  # end

  get '/categories', to: 'categories#index'
  get '/categories/:category_id/articles', to: 'articles#index', as: 'category_articles'
  post '/categories/:category_id/articles', to: 'articles#create'
  get '/categories/:category_id/articles/new', to: 'articles#new', as: 'new_category_article'
  get '/categories/:category_id/articles/:id', to: 'articles#show', as: 'category_article'
  patch '/categories/:category_id/articles/:id', to: 'articles#update'
  put '/categories/:category_id/articles/:id', to: 'articles#update'
  delete '/categories/:category_id/articles/:id', to: 'articles#destory'
  get '/categories/:category_id/articles/:id/edit/:code', to: 'articles#edit', as: 'edit_category_article'

  post '/users', to: 'users#create', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/new', to: 'users#new', as: 'new_user'

  # resources :users, only: [:show, :create, :new]

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'session', to: 'sessions#inspect'

  root 'categories#index'
end
