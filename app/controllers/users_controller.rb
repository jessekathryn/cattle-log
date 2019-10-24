class UsersController < ApplicationController
#make sure username is unique
#sign up is filled in and not duplicate
    get "/users/:id" do
        @user = User.find_by(params[:user])
        erb :'/users/show'
    end

    get "/signup_welcome" do
        if !logged_in?
            erb :'signup_welcome'
        else
            redirect to '/users/show'
        end
    end
     
    post "/signup_welcome" do
        @user = User.new(:email => params[:email], :username => params[:username], :password => params[:password])
            if @user.username != "" && @user.email != "" && @user.password != "" && @user.password_digest
                @user.save
                session[:user_id] = @user.id  
                redirect to '/cows/all'
            else
                redirect to '/signup_welcome'
        end
    end

    get "/login" do
        if logged_in?
            redirect to '/cows/all'
        else   
            erb :login  
        end 
    end

    post "/login" do
        @user = User.find_by(:username => params[:username])
            if @user && @user.username && @user.authenticate(params[:password])
             session[:user_id] = @user.id
                redirect to "/users/#{@user.id}"
            else
                redirect to '/login'
            end
        end 

    get "/logout" do 
        if logged_in?
            session.clear
            redirect to '/login'
        else
            redirect to '/'
        end
    end
end