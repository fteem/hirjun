Hirejuniors::Application.routes.draw do
  resources :job_ads

  devise_for :users

  root 'job_ads#index'
end
