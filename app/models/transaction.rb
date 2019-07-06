class Transaction < ApplicationRecord
  belongs_to :user

  validates :made_to, :trans_type, :amount, :user, presence: true 
end
