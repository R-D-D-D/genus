class SearchPageController < ApplicationController

    #Search bar to search for keyword among titles
    def search  
        if params[:search].blank?  
            return  
        else  
            @parameter = params[:search].downcase
            @results = Event.where("lower(title) LIKE :search", search: "%#{@parameter}%").uniq
        end  
    end
end