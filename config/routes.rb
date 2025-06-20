Rails.application.routes.draw do

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :public do
    get 'sessions/new'
  end

  devise_for :members, controllers: {
  registrations: 'public/registrations',
  sessions: 'public/sessions'
}
  
  scope module: :public do
    root 'homes#top'

    get 'how_to', to: 'homes#how_to'
    get '/members/edit_profile', to: 'members#edit_profile', as: 'edit_profile'
    patch '/members/update_profile', to: 'members#update_profile', as: 'update_profile'
    get '/members/unsubscribe', to: 'members#unsubscribe', as: 'unsubscribe'
    get '/members/saved_posts', to: 'members#saved_posts', as: 'saved_posts'

    resources :members, only: [:show] do
      member do
        get :followers          
        get :followings         
      end
      resource :relationship, only: [:create, :destroy]
    end

    resources :notifications, only: :index

    resources :posts do
      collection do
        get :followings
      end
      resources :comments, only: [:create, :destroy]
      resource :saved_post, only: [:create, :destroy]
    end
  end
end