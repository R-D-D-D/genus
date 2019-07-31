class SearchPageController < ApplicationController

    #Search bar to search for keyword among titles
    def search  
        if params[:search].blank?  
            flash.now[:alert] = 'Empty Field!' and return  
        else  
            @parameter = params[:search].downcase
            @results = Event.all.where("lower(title) LIKE :search", search: "%#{@parameter}%").uniq
        end  
    end
end