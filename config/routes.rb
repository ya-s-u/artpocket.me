Rails.application.routes.draw do

  root 'posts#index'
  get 'posts/complete' => 'posts#complete', as: :complete_post
  resources :posts
  get 'about' => 'statics#about', as: :about_statics
  get 'terms' => 'statics#terms', as: :terms_statics

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount API => '/'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"

  end

end
