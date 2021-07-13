Rails.application.routes.draw do

  devise_for :users
  root to: 'homs#top'
  get 'homs/about'
  get 'homs/mypage'
  get '/search', to: 'searchs#search'
  get 'searchs/searches'
  get 'search' => 'shops#search'
  get 'shops/search' => 'shops#search', as: 'search_shops'

  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  resources :cooks, only:[:index, :show, :create, :edit, :update, :destroy]
  resources :events,          only:[:show, :create, :destroy, :edit, :update]
  resources :shops,          only:[:index, :show, :create, :edit, :update, :destroy, :search] do
   resources :products
   resources :genres,        only:[:new, :edit, :create, :update, :destroy ]
   resources :shop_comments, only:[:create, :destroy]
   resource :favorites,      only: [:create, :destroy]
   resource :bookmarks,      only: [:create, :destroy]
  end
  resources :users,          only:[:show, :index, :create, :update, :edit, :destroy] do
  member do
  get 'withdrow_confirm'
  patch 'withdrow'
  end
   resource :relationships,  only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers' ,as: 'followers'
  end
  resources :tags do
    get 'cooks', to: 'cooks#search'
  end  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
