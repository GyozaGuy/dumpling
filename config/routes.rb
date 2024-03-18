Dumpling::Engine.routes.draw do
  get 'assets/*path' => 'dumpling_assets#show'
end
