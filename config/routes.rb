Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Show media#index when going to url localhost:3000/media
  get 'media', to: 'media#index'
  get 'media/:id', to: 'media#show', as: 'medium'
end
