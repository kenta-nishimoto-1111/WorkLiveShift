Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations',
                                   sessions: 'users/sessions' }
  root 'companies#index'

  resources :personalities ,only:[:index] do
    collection do 
      get 'first_question'
     end
     collection do 
      get 'second_question'
     end
    end
  end

