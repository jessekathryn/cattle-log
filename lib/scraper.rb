class User::Scraper
  
attr_accessor :temperature, :summary, :date
      
def self.scrape_weather_page
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