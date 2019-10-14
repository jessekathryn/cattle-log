require 'pry'
class Cow < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :field

    def slug
        name.gsub(" ", "-").downcase
    end
    
    def self.find_by_slug(slug)
        Cow.all.find do |slug|
        slug.name
        end
    end
end
