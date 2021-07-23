Rails.application.routes.draw do

  devise_for :users
  root to: 'homs#top'
  get 'homs/about'
  get 'homs/mypage'
  # get '/search',     to: 'searchs#search'
  get 'searchs/searches'
  get 'search'       => 'shops#search'
  # get 'shops/search' => 'shops#search', as: 'search_shops'
  get 'searchs/shop_search' => 'searchs#shop_search', as: 'search_search_shops'#並び替え実験

  resources :notifications,  only: [:index, :destroy]
  delete    'notifications'                 => 'notifications#all_destroy', as: 'all_destroy'
  resources :messages,       only: [:show, :create]
  resources :cooks,          only:[:index, :show, :create, :edit, :update, :destroy]
  get '/tags'   => 'cooks#tags', as: 'cooks_tag'
  resources :tags,           only:[:destroy]
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
  get 'withdrow_confirm'git
  patch 'withdrow'
  end
   resource :relationships,  only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers'  => 'relationships#followers' , as: 'followers'
  end
  get '/users/:id/search' => 'users#search', as: 'search_shops'
  resources :tags do
    get 'cooks', to: 'cooks#search'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
