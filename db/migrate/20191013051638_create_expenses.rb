class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :notes 
      t.integer :car_truck
      t.integer :chemicals
      t.integer :conservation
      t.integer :depreciation
      t.integer :employees
      t.integer :feed 
      t.integer :freight_trucking
      t.integer :gas 
      t.integer :insurance 
      t.integer :interest 
      t.integer :mortgage 
      t.integer :rent 
      t.integer :repairs 
      t.integer :seeds_plants
      t.integer :storage
      t.integer :supplies 
      t.integer :taxes 
      t.integer :vet
      t.integer :tools
      t.integer :fencing_land
      t.integer :calf 
      t.integer :dues 
      t.integer :misc_labor 
      t.integer :professional
      t.integer :user_id
    end
  end
end
