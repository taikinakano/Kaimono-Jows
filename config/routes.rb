Rails.application.routes.draw do

  devise_for :users
  root to: 'homs#top'
  get 'homs/about'
  resources :shops, only:[:index, :show, :create, :edit, :update, :destroy]
  resources :users, only:[:show, :index, :create, :update, :edit, :destroy] do
  member do
  get 'withdrow_confirm'
  patch 'withdrow'
  end
  end

  resources :genre, only:[:edit, :new, :create, :update, :destroy ]
  resources :product, only:[:new, :create, :show, :index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
