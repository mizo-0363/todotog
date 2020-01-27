Rails.application.routes.draw do
  get 'grouplist/new'
  get 'grouplist/edit'
  get 'list/new'
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
}
  root 'top#index'
  resources :users, only: [:index, :edit, :update]
  resources :groups do
    resources :grouplist do
      resources :groupcard
    end
  end

  resources :list, only: [:new, :create, :edit, :update, :destroy]do
    resources :card, expect: [:index]
  end
end
