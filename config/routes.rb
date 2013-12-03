Hirejuniors::Application.routes.draw do
  resources :jobs

  root 'jobs#index'
  get 'jobs/confirm/:token', to: 'jobs#confirm', as: 'confirm_job'
  get '/about', to: 'static#about'
end
