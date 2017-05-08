Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :categories, only: [:index] do
    resources :articles, except: [:edit]
  end

  get '/categories/:category_id/articles/:id/edit/:code', to: 'articles#edit', as: 'edit_category_article'

  root 'categories#index'
end
