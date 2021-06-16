Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations',
                                   sessions: 'users/sessions' }
  root 'companies#index'

  resources :users, only: :show

  resources :user_question_answers do
    collection do 
      get 'first_question'
     end
     collection do 
      get 'second_question'
     end
    end
  end

