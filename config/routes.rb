Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Media-related routes
  get 'media', to: 'media#index'
  get 'media/:id', to: 'media#show', as: 'medium'

  # Tag-related routes
  get 'tags', to: 'tags#index'
  get 'tags/:id', to: 'tags#show', as: 'tag'

  # Static Pages
  get 'about', to: 'pages#about', as: 'about'
end
