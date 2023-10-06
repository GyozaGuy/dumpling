Rails.application.routes.draw do
  mount Dumpling::Engine => '/dumpling'

  get 'test', to: 'pages#test'
end
