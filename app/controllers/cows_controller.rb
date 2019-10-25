class CowsController < ApplicationController

    get "/cows/all" do
      redirect_if_not_logged_in
      @cows = current_user.cows
      erb :'/cows/all'
    end

    get "/cows/add_new" do
      redirect_if_not_logged_in
      erb :'/cows/add_new'
    end

    post "/cows/all" do
      redirect_if_not_logged_in
        if params[:cow][:name].empty?  
          redirect to '/cows/add_new'
        else
          @cow = Cow.create(params[:cow])
          @cow.user_id = current_user.id
          if @cow.save
            redirect("/cows/all")
          end 
      end
  end

  get "/cows/:id" do
    redirect_if_not_logged_in
    @cow = Cow.find_by_id(params[:id])
    erb :'/cows/show'
  end

  get "/cows/:id/edit" do
    redirect_if_not_logged_in
    if  @cow = Cow.find_by_id(params[:id])
        @cow && @cow.user == current_user
        erb :"/cows/edit"
    else 
        redirect to '/cows/all'
    end
  end

    patch '/cows/:id/edit' do
      redirect_if_not_logged_in
        @cow = Cow.find_by_id(params[:id])
        if @cow && @cow.user == current_user
          @cow.update(params[:cow])
        else
          redirect to "/cows/#{@cow.id}"
      end
    end

    delete "/cows/:id/delete" do
       redirect_if_not_logged_in
        @cow = Cow.find_by_id(params[:id])
        if @cow && @cow.user == current_user
          @cow.delete
        else
          redirect to '/cows/all'
      end
    end

end
