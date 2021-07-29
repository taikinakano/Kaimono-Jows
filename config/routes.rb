Rails.application.routes.draw do

  devise_for :users
  root to: 'homs#top'
  get 'homs/about'
  get 'homs/mypage'
  # get '/search',     to: 'searchs#search'
  get 'searchs/searches'
  get 'search'       => 'shops#search'
  get 'shops/search' => 'shops#search', as: 'favorite_search_shops' #shop/indexの並び替え機能
  get 'searchs/shop_search' => 'searchs#shop_search', as: 'search_search_shops'#並び替え実験

  resources :notifications,  only: [:index, :destroy]
  delete    'notifications'                 => 'notifications#all_destroy', as: 'all_destroy'
  resources :messages,       only: [:show, :create]
  # resources :cooks,          only:[:index, :show, :create, :edit, :update, :destroy]
  get '/tags'   => 'cooks#tags', as: 'cooks_tag'  #タグの一覧画面
  resources :tags,           only:[:destroy] do  #タグによって絞り込んだ投稿を表示するアクションへのルーティング
    get 'cooks', to: 'cooks#search'
  end
  resources :events,         only:[:show, :create, :destroy, :edit, :update]
  resources :shops,          only:[:index, :show, :create, :edit, :update, :destroy, :search] do
   resources :products
   get '/product_search' => 'products#product_search', as: 'product_search'#商品検索
   resources :genres,        only:[:new, :edit, :create, :update, :destroy ]
   resources :shop_comments, only:[:create, :destroy]
   resource :favorites,      only: [:create, :destroy]
   resource :bookmarks,      only: [:create, :destroy]
  end
  resources :users   do
    member do
    get 'withdrow_confirm'
    patch 'withdrow'
    end
   resource :relationships,  only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers'  => 'relationships#followers' , as: 'followers'
   resources :cooks,          only:[:index, :show, :create, :edit, :update, :destroy] do
     
   end
  end
  get '/users/:id/search' => 'users#search', as: 'search_shops' #users/showの検索機能

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
