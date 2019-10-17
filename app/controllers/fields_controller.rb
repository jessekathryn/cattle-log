class FieldsController < ApplicationController

        get "/fields/all" do
            if logged_in? 
                @fields = Field.all
                erb :'/fields/all'
            else
                redirect to '/login'
            end
        end
    
        get "/fields/add_new" do
            if logged_in?  
               erb :'/fields/add_new'
            else
               redirect to '/login'
            end
        end
    
        post "/fields/all" do
          if logged_in?
            if params[:field].empty?  
              redirect to '/fields/add_new'
            else
              @field = Field.create(params[:field])
              if @field.save
                redirect("/fields/all")
            end 
             redirect to '/login'
          end  
        end
      end
    
      get "/fields/:id" do
        if logged_in?
          @field = Field.find_by_id(params[:id])
          @field.save
          erb :'/fields/show'
        else 
          redirect to '/login'
        end
      end
    
      get "/fields/:id/edit" do
        if logged_in? 
          @field = Field.find_by_id(params[:id])
          @field.save
            erb :"/fields/edit"
        else
          redirect to '/login'
        end 
      end
    
        patch '/fields/:id/edit' do
          if logged_in?  
            @field = Field.find_by_id(params[:id])
            @field.update(id: params[:id])
            @field.save(id: params[:id])
              redirect to "/fields/#{@field.id}"
          else
            redirect to '/login'
          end
        end
    
        delete "/fields/:id/delete" do
          if logged_in?
            @field = Field.find_by_id(params[:id])
             @field.delete
              redirect to '/fields/all'
              else
              redirect to '/login'
          end
        end
    
     
end