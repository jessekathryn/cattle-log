require 'nokogiri'
require 'open-uri'

class User < ActiveRecord::Base
    has_secure_password
    
    has_many :cows
    has_many :fields
    has_many :expenses

    def time 
      time = Time.new
      puts "Current Time : " + time.inspect
    end

    def get_temp
    page = open("https://www.wunderground.com/weather/us/sc/islandton/29929")
    doc = Nokogiri::HTML(page)
      temperature_scraped = doc.at_css("div.current-temp lib-display-unit span span.wu-value.wu-value-to").text.strip
      temperature_scraped
    end

    def weather_text
    page = open("https://www.wunderground.com/weather/us/sc/islandton/29929")
    doc = Nokogiri::HTML(page)
      text_scraped = doc.at_css("div div.condition-icon.small-6.medium-12.columns p").text.strip
    end

    def get_market_prices
      page = open("https://beefmarketcentral.com/")
      doc = Nokogiri::HTML(page)
        price_scraped = doc.at_css("#ctl00_MainContent_fcHostContent_ctl00_ctl00_ctl00__sideContentDiv_2 > div > ul:nth-child(3) > a > li.fcDataViewLastTextLeft").text.strip
    end
  end
