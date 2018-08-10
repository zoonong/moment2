class ProfileController < ApplicationController
    
    def index
        @profile = Profile.where(user_id:params[:user_id])
        @temp = params[:user_id]
    end
    
    def new
        @categories = Category.all.map { |cat| [cat.name, cat.id] }
    end

    def create
        @profile = Profile.new
        @profile.user_id= params[:user_id]
        @profile.category_id = params[:category_id]
        @profile.save
        redirect_to "/profile/show/#{@profile.id}"
    end

    def edit2
        @profile = Profile.find(params[:id])
    end
    
    def update
        @profile = Profile.find(params[:id])
        @profile.title = params[:title]
        @profile.user_name = params[:user_name]
        @profile.category_id = params[:category_id]
        @profile.save
        redirect_to "profile/index"
    end
    
    def show
        @profile = Profile.find(params[:id])
        @temp = params[:user_id]
    end
    
    def delete
        @profile = Profile.find(params[:id])
        @profile.delete
        redirect_to "profile/index"
    end
end