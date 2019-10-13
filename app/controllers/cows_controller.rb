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

    get "/cows/:slug" do
      @cow = Cow.find_by_slug(params[:slug])
      redirect to "/cows/show"
    end
  
    post "/cows" do
      if logged_in?
       @cow = Cow.create(:name => params["name"])
       @cow = current_user.cows.build(name: params[:name])
       @cow.save
          redirect("/cows/#{@cow.slug}")
      else 
        redirect to '/login'
      end
    end

    get "/cows/:id/edit" do
            if logged_in? && @cow && @cow.user == current_user
                @cow = Cow.find_by_slug(params[:slug]) 
                erb :"/cows/#{@cow.slug}"
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
