class  Cow < ActiveRecord::Base
    
    belongs_to :users
    has_many :fields


end
