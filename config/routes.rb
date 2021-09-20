Rails.application.routes.draw do
    resources :tasks, only: [:new, :create, :edit, :update, :destroy]
    resources :users, only: [:new, :create]
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    get '/', to: 'tasks#index'
    get '/tasks', to: redirect("/");
    get '/tasks/:id', to: redirect("/");
end
