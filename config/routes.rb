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

    resources :companies do
      collection do 
        get 'first_step'
      end
      collection do 
        get 'second_step'
      end
      collection do 
        get 'third_step'
      end
      collection do 
        get 'fourth_step'
      end
      collection do 
        get 'fifth_step'
      end
      collection do 
        get 'sixth_step'
      end
    end


end

