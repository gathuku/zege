class Transaction < ApplicationRecord
  include ActiveModel::Lint::Tests
  belongs_to :user, required: false

  validates :made_to, :trans_type, :amount, :user, presence: true

  def handle_transfer(user,sent_to,amount)
   @trans=Transaction.new(
     amount: amount.to_f,
     user_id: user.id,
     made_to: sent_to,
     trans_type: 'debit'
   )

   receiver=User.find_by(email: sent_to)
   sender_wallet=user.wallet-=@trans.amount
   receiver_wallet=receiver.wallet+=@trans.amount

   # Handle in a transaction block
   Transaction.transaction do
     @trans.save
      user.update(wallet: sender_wallet)
      receiver.update(wallet:receiver_wallet)
   end
  end

  def handle_top_up(user,amount)
    @trans=Transaction.new(
      amount: amount.to_f,
      user_id: user.id,
      made_to: user.email,
      trans_type: 'credit'
    )
    wallet_amount=user.wallet+=@trans.amount

    #Handle in a transaction block
    Transaction.transaction do
     @trans.save!
     user.update!(wallet: wallet_amount)
    end

  end
end
