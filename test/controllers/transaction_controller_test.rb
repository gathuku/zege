require 'test_helper'

class TransactionControllerTest < ActionDispatch::IntegrationTest
  def setup
    @transaction=transactions(:one) # from fixtures
    @user=User.new(name:'John Doe',email:'johndoe@gmail.com',password:'password',
                   authentication_token:SecureRandom.alphanumeric, wallet:10.0)
  end

  test 'should have transfer' do
    post '/transaction/tranfer', params: {amount:@transaction.amount,made_to:@transaction.made_to}
      assert_response :success
  end

  # test 'should perform a transaction' do
  #   assert_difference(Transaction.count.to_s,+1) do
  #     post '/transaction/tranfer', params: {amount:@transaction.amount, made_to:@transaction.made_to}
  #   end
  # end

  # test 'should have token gurd' do
  #   refute TransactionController.new.token_guard,'private method call'
  # end
end
