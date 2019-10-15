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
        if params[:cow].empty?  
          redirect to '/cows/add_new'
        else
          @cow = Cow.create(params[:cow])
          if @cow.save
            redirect("/cows/#{@cow.id}")
        end 
         redirect to '/login'
      end  
    end
  end

  get "/cows/:id" do
    if logged_in?
      @cow = Cow.find_by(params[:cow])
      erb :'/cows/show'
    else 
      redirect to '/login'
    end
  end

  get "/cows/:id/edit" do
    if logged_in? 
      @cow = Cow.find_by_id(params[:id])
        erb :"/cows/edit"
    else
      redirect to '/login'
    end 
  end

    patch '/cows/:id' do
      if logged_in?  
        @cow = Cow.find_by_id(params[:id])
        @cow.update(params[:cow])
          redirect to "/cows/#{@cow.id}"
      else
        redirect to '/login'
      end
    end

    delete "/cows/:id/delete" do
      if logged_in?
        @cow = Cow.find_by_id(params[:id])
         @cow.delete
          redirect to '/cows/all'
          else
          redirect to '/login'
      end
    end

end
