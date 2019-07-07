class UserController < ApplicationController

  def register
    @user=User.new({
      name: params[:name],
      email: params[:email],
      password: params[:password],
    })
    @user.authentication_token=SecureRandom.alphanumeric
    @user.save!
    if @user
      render json:{status:'success',code:200,email:@user.email,token:@user.authentication_token}
    else
      head(:unprocessable_entity)
    end
  end

end
