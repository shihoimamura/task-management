Rails.application.routes.draw do
  get 'task/management'
  get '/task', to: 'task#index' #追記する
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
