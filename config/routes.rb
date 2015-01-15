Rails.application.routes.draw do

  # Root
  root 'posts#index'

  # Post
  get 'flyer' => 'posts#index', as: :index_post
  get 'flyer/new' => 'posts#new', as: :new_post
  post 'flyer/new' => 'posts#create', as: :create_post
  get 'flyer/complete' => 'posts#complete', as: :complete_post
  get 'flyer/category/:category' => 'posts#category', as: :category_post
  get 'flyer/:id' => 'posts#show', as: :show_post

  # Static
  get 'about' => 'statics#about', as: :about_statics
  get 'terms' => 'statics#terms', as: :terms_statics
  get 'contact' => 'statics#contact', as: :contact_statics

  # Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # API
  mount API => '/api'

  # Only Local Env
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # Exception
  get '*path', to: 'application#render_404'

end
