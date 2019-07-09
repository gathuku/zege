require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
   def setup
     @user=users(:valid)
   end

   test 'should get register' do
     post '/user/register', params: {name:@user.name, email:@user.email, password:@user.password_digest}
      assert_response :success
   end

end
