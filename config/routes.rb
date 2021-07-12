Rails.application.routes.draw do
  devise_for :suppliers, controllers: {
    sessions: 'suppliers/sessions',
    passwords: 'suppliers/passwords',
    registrations: 'suppliers/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root 'companies#top'

  resources :users, only: :show
  resources :profiles, only: %i[new create edit update]
  resources :careers, only: %i[new create edit update destroy]

  resources :chats, only: %i[index new create show] do
    resources :messages, only: %i[new create]
  end

  namespace :supplier do
    resources :chats, only:[:index,:new,:create,:show] do
      resources :messages, only:[:new,:create]
    end

    resources :companies, only:[:index, :create, :show] do
      resource :favorites, only: [:show, :create, :destroy]
      resource :entries, only: [:new, :create, :destroy]
      collection do 
        get 'top'
        get 'first_step'
        get 'second_step'
        get 'third_step'
        get 'fourth_step'
        get 'fifth_step'
        get 'sixth_step'
        get 'double_check'
      end
    
      member do 
        get 'company_details'
      end
    end
  end

  resources :user_question_answers, only:[:show] do
    collection do 
      get 'choice_questions'
      post 'answer_choice_questions'
      get 'scale_questions'
      post 'scale_choice_questions'
      get 'thinker'
      get 'pasi'
      get 'hamo'
      get 'ima'
      get 'revel'
      get 'pro'
    end
  end

    resources :companies, only:[:index, :show] do
      resource :favorites, only: [:show, :create, :destroy]
      resource :entries, only: [:new, :create, :destroy]
      collection do 
        get 'top'
        get 'first_step'
        get 'second_step'
        get 'third_step'
        get 'fourth_step'
        get 'fifth_step'
        get 'sixth_step'
        get 'double_check'
      end
    
      member do 
        get 'company_details'
      end
    end

end
