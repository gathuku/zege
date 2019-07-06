class Transaction < ApplicationRecord
  belongs_to :user

  validates :made_to, :trans_type, :amount, :user, presence: true

  def handle_transfer
  end

  def handle_top_up 
  end
end
