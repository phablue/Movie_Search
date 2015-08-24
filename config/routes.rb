Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  devise_for :users, path: "", 
              path_names: {
              sign_in: 'sign-in', sign_out: 'sign-out', password: 'secret',
              confirmation: 'verification', unlock: 'unblock', registration: 'register',
              sign_up: 'sign-up' }

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
