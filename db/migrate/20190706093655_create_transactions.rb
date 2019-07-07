class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :made_to
      t.string :trans_type
      t.float :amount
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
