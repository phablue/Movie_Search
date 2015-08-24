Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  devise_for :users

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
  end

  controller :movies do
    get 'result',     action: :result
    get 'movies/:id', action: :show   , as: 'movie'
  end

  controller :favorites do
    get 'my-list',    action: :index
    post 'my-list',   action: :create
    delete 'my-list', action: :destroy
  end

  root 'movies#main'
end
