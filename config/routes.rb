Dumpling::Engine.routes.draw do
  root 'styleguide#index'

  resources :styleguide, only: %i[index show]
end
