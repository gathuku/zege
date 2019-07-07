Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'user/register', to:'user#register'
  post 'user/login', to: 'session#login'
  delete 'user/logout', to: 'session#logout'
  post 'transaction/topup', to: 'transaction#topup'
  post 'transaction/tranfer', to: 'transaction#transfer'
  get 'account/balance', to: 'transaction#balance'
  get 'account/notification', to: 'transaction#notification'

end
