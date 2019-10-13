class  Field < ActiveRecord::Base
    
    belongs_to :user
    has_many :cows
    
end
