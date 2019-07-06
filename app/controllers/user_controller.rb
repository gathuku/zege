class UserController < ApplicationController

  def register
    # hash with form params
    form_params={
      name: params[:name],
      email: params[:email],
      password: params[:password],
    }
    user_obj=User.new
    user=user_obj.create_new_user(form_params)

  end

  def login

  end

  def logout
  end

  private
  def token_guard
    if request.headers['Authorization'].present?
     token=request.headers['Authorization'].split(' ').last
     token_user=User.where(authentication_token: token).first
     #return the bearer Token User
   else
     head(:unauthorized)
   end
  end
end
