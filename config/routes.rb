Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  get "home/about"=>"homes#about"
  get "/search", to: "searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:index,:show,:edit,:update] do
    member do
    get :follows, :followers
    # member:初期設定にあるアクション以外のものを
    # routeに登録したい時に使用  
    # :idがつくURIを生成するタイプ
    # follows,followersをget HTTPに追加した
    end
      resource :relationships, only: [:create, :destroy]
  end

  # いいねのidはURLに含める必要がないのでresource

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
