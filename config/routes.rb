Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'user/register', to:'user#register'
  post 'user/login', to: 'session#login'
  delete 'user/logout', to: 'session#logout'

end
