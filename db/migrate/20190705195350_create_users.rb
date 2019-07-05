class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :authentication_token, limit:30, unique:true, null: true
      t.float  :wallet, default:0.0
      t.timestamps
    end
  end
end
