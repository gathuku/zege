require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user=users(:valid)
  end

  test 'should get login' do
    post '/user/login'
    assert_response :success
  end

  test 'should get logout' do
    delete '/user/logout'
    assert_response :success
  end


end
