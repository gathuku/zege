class SessionController < ApplicationController
  def login
      @user=User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
          #assign authentication_token
          @user.authentication_token=SecureRandom.alphanumeric
           #save overwrite token
           @user.save
          render json:{status:'success',code:200,message:'Logged In',token:@user.authentication_token}
      else
        render json:{status:'error',code:404, message: 'Email or password not correct'}
      end
  end

  def logout
      user=User.find_by(authentication_token: params[:token])
      if user
      user.authentication_token=nil
      render json:{status:'success',code:200,message:'Logged Out'}
      else
        render json:{status:'error',code:404,message:'Not found'}
      end
  end

end
