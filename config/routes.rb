Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations',
                                   sessions: 'users/sessions' }
  root 'companies#index'

  resources :users, only: :show
  resources :profiles, only:[:new,:create,:edit,:update]
  resources :careers, only:[:new,:create,:edit,:update,:destroy]


  resources :user_question_answers do
    collection do 
      get 'choice_questions'
     end
     collection do 
      get 'label_questions'
     end
    end
  end

