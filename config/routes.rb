Rails.application.routes.draw do
    resources :users, only: [:new, :create]
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    get '/', to: 'sessions#welcome'
end
