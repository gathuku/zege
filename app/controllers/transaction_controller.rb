class TransactionController < ApplicationController


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
