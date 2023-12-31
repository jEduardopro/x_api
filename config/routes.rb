
require "sidekiq/web"
Sidekiq::Web.app_url = "/"

Rails.application.routes.draw do
	mount Sidekiq::Web => "/sidekiq"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

	namespace :api do
		namespace :auth do
			post 'register', action: :register, controller: 'register'
			post 'confirm-account', action: :confirm_account, controller: 'confirm_account'
			post 'login', action: :login, controller: 'login'
		end

		namespace :home do
			get 'timeline', action: :index, controller: 'home_timeline'
		end

		namespace :tweets do
			post '/', action: :create, controller: 'tweet'
		end
	end

end
