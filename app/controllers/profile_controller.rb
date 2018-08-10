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
        @userid = current_user.id
        redirect_to "/profile/#{@userid}"
    end

    def edit2
        @profile = Profile.find(params[:id])
    end
    
    def update
        @profile = Profile.find(params[:id])
        @profile.user_name = params[:user_name]
        @profile.category_id = params[:category_id]
        @profile.save
        @userid = current_user.id
        redirect_to "/profile/#{@userid}"
    end
    
    def show
        @profile = Profile.find(params[:id])
        @temp = params[:user_id]
    end
    
    def destroy
        @profile = Profile.find(params[:id])
        @profile.destroy
        redirect_to(:back)
    end
end