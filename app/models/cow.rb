require 'pry'
class Cow < ActiveRecord::Base
    
    belongs_to :user

end
