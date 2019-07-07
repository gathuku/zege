require 'test_helper'

class TransactionControllerTest < ActionDispatch::IntegrationTest
  def setup
    @transaction=transactions(:one) # from fixtures
    @user=User.new(name:'John Doe',email:'johndoe@gmail.com',password:'password',
                   authentication_token:SecureRandom.alphanumeric, wallet:10.0)
  end

  test 'should have transfer' do
    post '/transaction/tranfer', params: {amount:@transaction,made_to:@transaction.made_to}
      assert_response :success
  end
end
