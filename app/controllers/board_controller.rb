class BoardController < ApplicationController
    
    def show
        #한 개의 포스트를 보여주는 뷰
    end
    
    
    def edit
        #게임별 category_id 나눠서 if문 사용
        @board = Board.find(params[:board_id])
    end
    
    def create
        @board = Board.new
        @board.title = params[:board][:title]
        @board.user_name = params[:board][:user_name]
        @board.content = params[:board][:content]
        @board.save
        redirect_to "/board/show/#{@board.id}"
        #redirect에 if문 적용
    end
    
    def destroy
        @board = Board.find(params[:board_id])
        @board.destroy
        redirect_to '/'
       #redirect에 if문 적용 
    end

# ---------------

    def lol
        #모든 롤 카테고리의 포스트를 보여주는 뷰
    end
    

    def overwatch
    
    end
    

    def wow
    
    end
end
