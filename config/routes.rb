Rails.application.routes.draw do
  resources :friendships  
  devise_for :users,:controllers=>{registrations:"registrations"}
  resources :tweeets do
    # put "/create", to: "likes#create"
    # delete "/destroy", to: "likes#destroy"
    post "likes/toggle"
    delete 'like/:id',  to: 'likes#toggle'
    resources :comments
  end
  root "tweeets#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  