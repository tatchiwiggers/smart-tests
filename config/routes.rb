Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'pages#home'
  get 'search', to: 'questionnaires#search'
  resources :questionnaires
  resources :student_grades, only: [:create]
end
