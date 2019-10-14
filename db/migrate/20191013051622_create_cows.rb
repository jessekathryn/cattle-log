class CreateCows < ActiveRecord::Migration
  def change 
    create_table :cows do |t|
        t.string :name
        t.integer :tag_number
        t.string :type
        t.integer :age
        t.integer :birthdate
        t.integer :weight
        t.string :health
        t.string :color
        t.integer :user_id
      end
   end
end
