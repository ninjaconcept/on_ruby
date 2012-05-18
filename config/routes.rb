HamburgOnRuby::Application.routes.draw do

  module WithSubdomain
    def self.matches?(request)
      Whitelabel.find_by_subdomain(request.subdomain)
    end
  end

  module NoSubdomain
    def self.matches?(request)
      request.subdomain.blank? || request.subdomain == "www"
    end
  end

  devise_for :users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  constraints(WithSubdomain) do
    resources :wishes do
      resources :votes
    end

    resources :locations do
      get 'company', on: :collection
    end

    resources :events do
      get 'rss',        on: :collection, format: :xml
      post 'add_user',  on: :member
      get 'publish',    on: :member
      resources :materials
      resources :topics
      resources :participants
    end

    root to: "labels#index"
  end

  constraints(NoSubdomain) do
    resources :users

    match '/auth/:provider/callback',       to: 'sessions#create'
    match '/auth/failure',                  to: 'sessions#failure'
    match '/admin/logout',                  to: 'sessions#destroy',              as: :destroy_admin_user_session # make the logout of rails-admin functional
    match '/auth/destroy_user_session',     to: 'sessions#destroy_user_session', as: :destroy_user_session
    match '/auth/destroy_session',          to: 'sessions#destroy',              as: :destroy_session
    match '/auth/login/:provider',          to: 'sessions#auth',                 as: :auth,                 defaults: { :provider => 'twitter' }
    match '/auth/offline_login/:nickname',  to: 'sessions#offline_login' if Rails.env.development?
  end

  # TODO: not sure what to do with these urls yet. mobile seems to be a dead end,
  # sitemap could be scoped to a subdomain and/or be available globally and i'm not
  # sure what to do with the api. [dh, 2012-05-13]

  #match '/mobile',     to: 'mobile#index',     as: :mobile
  #match '/sitemap.xml',   to: 'misc#sitemap',  format: :xml
  #match '/api',           to: 'api#index'

  root to: "home#index"
end
