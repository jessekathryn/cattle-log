class Temperature < ActiveRecord::Base
  
attr_accessor :temperature

    @@all = []

def initialize(weather_hash)
    weather_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
end
    
def self.create_from_collection(weather)
    weather.each do |weather|
      self.new(weather)
    end
  end

def add_weather_attributes(weather_page)
    weather_page.each {|key, value| self.send(("#{key}="), value)}
end

def self.all
    @@all
end 

def self.scrape_weather
    page = Nokogiri::HTML(open("https://www.wunderground.com/weather/us/sc/islandton/29929"))
    temperatures = []
    page.css("<#inner-content > div.region-content-main > div:nth-child(1) > div > div:nth-child(1) > div:nth-child(1) > lib-city-current-conditions > div > div.conditions-circle-wrap.small-12.medium-7.columns.text-center > div > div > div.feels-like > span>")
    weather_hash = {}
    weather_hash[:temperature] = temp.text.strip  
        weather_hash[:url] = temp.attribute("href").value
          temperatures << weather_hash
          temperatures
        end 
        temperatures
      end

def display_weather(input)  
    the_weather = @all
    attributes = self.scrape_article_page(the_weather.url)
          the_weather.add_weather_attributes(attributes)
            the_weather.temperatures
    end
 end





  
 
  
 
 