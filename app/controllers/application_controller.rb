require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "cow_secret"
  end

  get '/' do
    erb :signup_welcome
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def time?
      time = Time.new
      puts "Current Time : " + time.inspect
    end
  
    def redirect_if_not_logged_in
      if !logged_in?
        redirect to '/login'
      end
    end
  end
end
