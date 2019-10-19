class User < ActiveRecord::Base
    has_secure_password
    
    has_many :cows
    has_many :fields
    has_many :expenses

    def time 
      time = Time.new
      puts "Current Time : " + time.inspect
    end

end
