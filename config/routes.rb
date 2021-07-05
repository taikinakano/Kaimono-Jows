Rails.application.routes.draw do

  devise_for :users
  root to: 'homs#top'
  get 'homs/about'
  resources :shops, only:[:index, :show, :create, :edit, :update, :destroy] do
   resources :products
   resources :genres, only:[:new, :edit, :create, :update, :destroy ]
  end
  resources :users, only:[:show, :index, :create, :update, :edit, :destroy] do
  member do
  get 'withdrow_confirm'
  patch 'withdrow'
  end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
