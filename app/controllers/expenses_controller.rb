class ExpensesController < ApplicationController

    get "/expenses/all" do
        if logged_in? 
            @expense = Expense.all
            erb :'/expenses/all'
        else
            redirect to '/login'
        end
    end

    get "/expenses/add_new" do
        if logged_in?  
           erb :'/expenses/add_new'
        else
           redirect to '/login'
        end
    end

    post "/expenses/all" do
      if logged_in?
        if params[:expense].empty?  
          redirect to '/expenses/add_new'
        else
          @expense = Expense.create(params[:expense])
          if @expense.save
            redirect("/expenses/all")
        end 
         redirect to '/login'
      end  
    end
  end

  get "/expenses/:id" do
    if logged_in?
      @expense = Expense.find_by_id(params[:id])
      @expense.save
      erb :'/expenses/show'
    else 
      redirect to '/login'
    end
  end

  get "/expenses/:id/edit" do
    if logged_in? 
      @expense = Expense.find_by_id(params[:id])
      @expense.save
        erb :"/expenses/edit"
    else
      redirect to '/login'
    end 
  end

    patch '/expenses/:id/edit' do
      if logged_in?  
        @expense = Expense.find_by_id(params[:id])
        @expense.update(id: params[:id])
        @expense.save(id: params[:id])
          redirect to "/expenses/#{@expense.id}"
      else
        redirect to '/login'
      end
    end

    delete "/expenses/:id/delete" do
      if logged_in?
        @expense = Expense.find_by_id(params[:id])
         @expense.delete
          redirect to '/expenses/all'
          else
          redirect to '/login'
      end
    end

 
end