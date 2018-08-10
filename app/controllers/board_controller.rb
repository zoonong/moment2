class BoardController < ApplicationController
    
    def show
        #한 개의 게시글을 보여주는 뷰
    end
    
    def new
        @board = Board.new
    #    @categories = Category.all.map { |cat| [cat.name, cat.id] } new.html에 코드 추가해야함
    end
    
    def edit
        #게임별 category_id 나눠서 if문 사용
        @board = Board.find(params[:board_id])
    #    @categories = Category.all.map { |cat| [cat.name, cat.id] } edit.html에 코드 추가해야함
    end
    
    def create
        @board = Board.new
        @board.title = params[:board][:title]
        @board.content = params[:board][:content]
    #    @board.category_id = params[:category_id]
        @board.save
        redirect_to "/board/show/#{@board.id}"
        #redirect에 게임별 category_id 나눠서 if문 사용
    end
    
    def delete
        @board = Board.find(params[:board_id])
        @board.destroy
        redirect_to '/'
       #redirect에 게임별 category_id 나눠서 if문 사용
    end

# ---------------

    def lol
        #모든 롤 카테고리의 포스트를 보여주는 뷰 (롤의 category_id = 1로 가정)
    #    @lol = Category.find(params[:1])
    #    @lolposts = @lol.posts
    end
    

    def maple
        #모든 메이플 카테고리의 포스트를 보여주는 뷰 (메이플의 category_id = 2로 가정)
    #    @maple = Category.find(params[:2])
    #    @mapleposts = @maple.posts
    end
    
end
