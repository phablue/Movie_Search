Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  devise_for :users

  root 'movies#main'

  devise_scope :user do
    get "sign-in",         to: "devise/sessions#new"
    get "sign-up",         to: "devise/registrations#new"
    get "my-account/edit", to: "devise/registrations#edit"
  end

  controller :movies do
    get 'result',     action: :result
    get 'movies/:id', action: :show,   as: 'movie'
  end

  controller :favorites do
    get 'my-list',    action: :index
    post 'my-list',   action: :create
    delete 'my-list', action: :destroy
  end

  controller :rankings do
    get 'rank', action: :main
  end
end

