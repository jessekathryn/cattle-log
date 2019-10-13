
class CowsController < ApplicationController
     get "/cows" do
        if logged_in? 
            @cows = Cow.all
            erb :'/cows/all'
        else
            redirect to '/login'
        end
    end

    get "/cows/new" do
        if logged_in?  
           erb :'/cows/new'
        else
           redirect to '/login'
        end
    end

    post "/cows" do
        if logged_in?
          if params[:name] == ""
            redirect to "/cows/new"
          else
            @cow = current_user.cows.build(params)
            if @cow.save
              redirect to "/cows/#{@cow.id}"
            else
              redirect to "/cows/new"
            end
          end
        else
          redirect to '/login'
        end
      end

    get "/cows/:id" do
        if logged_in?
            @cow = Cow.find_by_id(params[:id])
            erb :'/cows/show'
        else
            redirect to '/login'
        end
    end

    get "/cows/:id/edit" do
            if logged_in? && @cow && @cow.user == current_user
                @cow = Cow.find_by_id(params[:id]) 
                erb :"/cows/#{@cow.id}"
            else
                redirect to '/login'
        end
    end
 

    delete "/cows/:id/delete" do
        if logged_in?
          @cow = Cow.find_by_id(params[:id])
          if @cow && @cow.user == current_user
            @cow.delete
          end
          redirect to '/cows'
        else
          redirect to '/login'
        end
    end
end
