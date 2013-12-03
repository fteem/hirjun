Hirejuniors::Application.routes.draw do
  resources :jobs

  root 'jobs#index'
  get 'jobs/confirm/:token', to: 'jobs#confirm', as: 'confirm_job'
  get 'jobs/remove_listing/:token', to: 'jobs#remove_listing', as: 'remove_listing'
  get '/about', to: 'static#about'
end
