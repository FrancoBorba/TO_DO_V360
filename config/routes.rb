Rails.application.routes.draw do
    # Rotas de login e logout
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # Apenas cadastro (new e create)
  resources :usuarios, only: [:new, :create]
  # Permite criar rotas aninhadas como get/lists/1/itens 
  # ou seja listar os itens da lista de id 1
  # A alteracao deve ser feita tambem no controller
  resources :lists do 
    resources :items
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Pagina principal: redireciona para o login
  root "sessions#new" 


end
