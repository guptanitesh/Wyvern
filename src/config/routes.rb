Rails.application.routes.draw do



  get 'leaderboards/new'

#  get 'quizzs/new', to: 'quizzs#new'
  post 'quizzs/new', to: 'quizzs#create'

  post 'answers/new', to: 'answers#create'
  
  post 'questions/new', to: 'questions#create'

  get '/leaderboard/subcategory', to: 'leaderboards#subcategory'
  get '/leaderboard/quizz', to: 'leaderboards#quizz'
  get '/leaderboard/category', to: 'leaderboards#category'


  post 'subcategories/new', to: 'subcategories#create'

  post 'categories/new', to: 'categories#create'

  get "/result", to: 'states#result'

#  get 'questions/new'

  get 'sessions/new'

#  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

	resources :users
  resources :questions
  resources :quizzs
  resources :states
  resources :answers
  resources :categories
  resources :subcategories
  
end
