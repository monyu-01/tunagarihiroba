Rails.application.routes.draw do
  namespace :public do
    get 'posts/new'
    get 'posts/index'
    get 'posts/show'
    get 'posts/followings_posts'
    get 'posts/edit'
  end
  namespace :public do
    get 'members/show'
    get 'members/dashboard'
    get 'members/edit_profile'
    get 'members/saved_posts'
    get 'members/followers'
    get 'members/followings'
    get 'members/edit_information'
    get 'members/unsubscribe'
  end
  namespace :public do
    get 'sessions/new'
  end
  namespace :public do
    get 'registrations/new'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/how_to'
  end
  devise_for :admins
  devise_for :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
