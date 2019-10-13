# cattle-log
Sinatra App Tracking Cattle

#Project title
'Cattle-log'

Sinatra App for Tracking Your Cows and Farm

This app easily let's you add and edit cow inventory for your herd of cattle. It also allows you to create fields that you own with coordinates and images. Included in the app is an expense tracker with an image uploader and notes field.

#Motivation
created for my father

This app is for my father. He keeps his work on the farm in his head, mostly recalling information about the cows by memory. This app allows him to simply keep track of his cattle: steers, heffers and bulls. Each cow is logged with the following attributes, if/when applicable: Name, Type (steer, heffer, bull), Age, Weight, Tag Number, Color, Health.

To keep the project simple, the only other modules/controllers used in this app are for catagorizing: Fields and Expenses.

Fields will only have two attributes: acreage, coordinates and will have many cows.

Expenses will only have two attributes: image and notes.

#Build status
cattle-log version 1.0 Beta version made for Flatiron school project

Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort:

#Install
myapp.rb require 'sinatra'

get '/' do 'Hello world!' end

Install the gem:

gem install sinatra And run with:

ruby myapp.rb View at: http://localhost:9393

#Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/jessekathryn/cattle-log. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

It is recommended to also run gem install thin, which Sinatra will pick up if available.
