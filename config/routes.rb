Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :members, session: { sign_in: 'login'}
  resources :posts do 
    resources :comments do
      resources :replies
    end
  end
  resources :likes
  resources :dislikes
  resources :messages
  resources :friendships
end