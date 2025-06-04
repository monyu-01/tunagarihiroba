Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
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
    get '/members/dashboard', to: 'members#dashboard',as: 'dashboard'
    get '/members/edit_profile', to: 'members#edit_profile', as: 'edit_profile'
    patch '/members/update_profile', to: 'members#update_profile', as: 'update_profile'
    get '/members/information/edit', to: 'members#edit_information', as: 'edit_information'
    patch '/members/update_information',to: 'members#update_information', as: 'update_information'
    get '/members/unsubscribe', to: 'members#unsubscribe', as: 'unsubscribe'
    delete '/members/withdraw', to: 'members#withdraw', as: 'withdraw'
    get '/members/saved_posts', to: 'members#saved_posts', as: 'saved_posts'

    resources :members, only: [:show] do
      member do
        get :followers          
        get :followings         
      end
    end
    resources :posts do
      collection do
        get :followings
      end
    end
  end
end