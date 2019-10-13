
class CowsController < ApplicationController
     get "/cows" do
        if is_logged_in? 
            @cows = Cow.all
            erb :'/index'
        else
            redirect to '/login'
        end
    end

    get "/cows/new" do
        binding.pry
        if is_logged_in?  
           erb :'/cows/new'
        else
           redirect to '/login'
        end
    end

    post "/cows" do
        if is_logged_in?
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
        if is_logged_in?
            @cow = Cows.find_by_id(params[:id])
            erb :'/cows/show'
        else
            redirect to '/login'
        end
    end

    get "/cows/:id/edit" do
            if is_logged_in? && @cow && @cow.user == current_user
                @cow = Tweet.find_by_id(params[:id])
                
                erb :"/cows/#{@cow.id}"
            else
                redirect to '/login'
        end
    end
 

    delete "/cows/:id/delete" do
        if is_logged_in?
          @cow = Tweet.find_by_id(params[:id])
          if @cow && @cow.user == current_user
            @cow.delete
          end
          redirect to '/cows'
        else
          redirect to '/login'
        end
    end
end
