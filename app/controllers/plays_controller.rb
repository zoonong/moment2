class PlaysController < ApplicationController
    def update
        @profile = Profile.find_by(user_id: self.id)
        @profile.introduction = params[:input_introduction]
    end     
end
