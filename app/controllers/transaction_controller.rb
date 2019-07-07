class TransactionController < ApplicationController
 before_action :token_guard, only:[:topup,:transfer,:balance]

 def topup
   trans=Transaction.new
   if trans.handle_top_up(@user,params[:amount])
     render json:{status:'success',message:'amount deposited'}
   end
 end

 def transfer
   if User.find_by(email:params[:email])
     if @user.wallet > params[:amount].to_f
       trans=Transaction.new
       trans.handle_transfer(@user,params[:email],params[:amount])
       return render json:{status:'success',code:200, message:'Funds Sent'}
     else
       return render json:{status:'error',message:'Insufficient Funds'}
     end
   else
     render json:{status:'error',message:'user does not exist'}
   end
 end

 def balance

 end

  private
  def token_guard
      if request.headers['Authorization'].present?
       token=request.headers['Authorization'].split(' ').last
        @user=User.where(authentication_token: token).first
       render json:{status:'error',code:401,message:'unauthorized'} unless @user
     end
  end
end
