Hirejuniors::Application.routes.draw do
  resources :job_ads

  devise_for :users

  root 'hello#index'
end
