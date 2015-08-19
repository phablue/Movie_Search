Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  controller :movies do
    get "result", to: :result
    get "movies/:id", to: :show, as: "movie"
  end

  controller :my_lists do
    get "my-list", to: :index
    post "my-list", to: :create
    delete "my-list", to: :destroy
  end

  root 'movies#main'
end
