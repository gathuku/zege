require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    #@transaction=Transaction.new(made_to: 'johndoe@gmail,com', trans_type: 'credit', amount: 100.0, user_id: 1)
    @transaction=transactions(:one)#From Fixtures
  end

  test 'valid transaction' do
    assert @transaction.valid?
  end

  test 'invalid without made_to' do
     @transaction.made_to=nil
     refute @transaction.valid?,'made_to required'
     assert_not_nil @transaction.errors[:made_to], 'validation for made_to required'
  end

  test 'invalid without trans_type' do
    @transaction.trans_type=nil
    refute @transaction.valid?, 'type required'
    assert_not_nil @transaction.errors[:trans_type], 'Validation for trans_type required'
  end

  test 'invalid without amount' do
    @transaction.amount=nil
    refute @transaction.valid?,'amount required'
    assert_not_nil @transaction.errors[:amount], 'validation for amount required'
  end

  test 'invalid without user' do
    @transaction.user=nil
    refute @transaction.valid?,'user required'
  end

  #Test model methods
  test 'handle_transfer' do
    trans_transfer=Transaction.new
    assert trans_transfer.handle_transfer , 'handle_transfer method required'
  end

  test 'handle_top_up' do
    trans_topup=Transaction.new
    assert trans_topup.handle_top_up , 'handle_top_up method required'
  end
end
