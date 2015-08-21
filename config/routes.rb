Rails.application.routes.draw do
  devise_for :users
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  controller :movies do
    get "result", action: :result
    get "movies/:id", action: :show, as: "movie"
  end

  controller :favorites do
    get "my-list", action: :index
    post "my-list", action: :create
    delete "my-list", action: :destroy
  end

  root 'movies#main'
end
