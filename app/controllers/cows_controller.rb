class CowsController < ApplicationController

    get "/cows/all" do
        if logged_in? 
            @cows = Cow.all
            erb :'/cows/all'
        else
            redirect to '/login'
        end
    end

    get "/cows/add_new" do
        if logged_in?  
           erb :'/cows/add_new'
        else
           redirect to '/login'
        end
    end
  
    post "/cows/all" do
      if logged_in?
        if params[:id] == ""
          redirect to "/cows/add_new"
        else
            @cow = current_user.cows.build(id: params[:id])
          if @cow.save
            redirect("/cows/show")
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
                @cow = Cow.find_by_slug(params[:id]) @
                erb :"/cows/#{@cow.id}"
            else
                redirect to '/login'
        end
    end

    delete "/cows/:id/delete" do
        if logged_in?
          @cow = Cow.find_by_slug(params[:slug])
          if @cow && @cow.user == current_user
            @cow.delete
          end
          redirect to '/cows/all'
        else
          redirect to '/login'
        end
    end
end
