Rails.application.routes.draw do

  devise_for :users
  root to: 'homs#top'
  get 'homs/about'
  resources :shops, only:[:index, :show, :create, :edit, :update, :destroy] do
   resources :products
   resources :genres, only:[:new, :edit, :create, :update, :destroy ]
   resource :favorites, only: [:create, :destroy]
  end
  resources :users, only:[:show, :index, :create, :update, :edit, :destroy] do
  member do
  get 'withdrow_confirm'
  patch 'withdrow'
  end
   resource :relationships, only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers' ,as: 'followers'
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  resources :cooks, only:[:index, :show, :create, :edit, :update, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
