class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :cows
      t.string :fields
      t.string :expenses
    end
  end
end
