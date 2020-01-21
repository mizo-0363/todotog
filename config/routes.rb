Rails.application.routes.draw do
  get 'list/new'
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
}
root 'top#index'

resources :list, only: [:new, :create, :edit, :update, :destroy]do
    resources :card, expect: [:index]
  end
end
