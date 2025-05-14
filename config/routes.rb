Rails.application.routes.draw do
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

  # Define a rota principal para a de criacao de listas com
   root "lists#index"
end
