class ProfileController < ApplicationController
    
    def index
        @profile = Profile.where(user_id: params[:user_id])
        @board = Board.where(profile_id: params[:profile_id])
        @pro = Profile.find(params[:profile_id])
        @temp = params[:profile_id]
        @profile_user = (params[:user_id]).to_i
    end
    
    def album
        #유저가 게시한 모든 게시물 표시 if current.user_id =
     #   @board = Board.where(profile_id: @profile)
     #   @profile = Profile.find_by(user_id: @user.to_i)
     #   @user = User.find(params[:user_id])
       # @user = (params[:user_id])
    end
    
    def mypage
        @profile = Profile.where(user_id: params[:user_id])
        @profile_user = (params[:user_id]).to_i
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
        redirect_to "/profile/mypage/#{@userid}"
    end

    def edit2
        @profile = Profile.find(params[:id])
    end
    
    def update
        @profile = Profile.find(params[:id])
        @profile.category_id = params[:category_id]
        @profile.save
        @userid = current_user.id
        redirect_to "/profile/mypage/#{@userid}"
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