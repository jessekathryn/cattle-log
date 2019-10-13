class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :notes 
      t.integer :user_id
    end
  end
end
