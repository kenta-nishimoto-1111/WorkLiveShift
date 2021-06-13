Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations',
                                   sessions: 'users/sessions' }
                                   
  root 'companies#index'
  resources :personalities ,only:[:index]
end

