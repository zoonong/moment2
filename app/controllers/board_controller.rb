class BoardController < ApplicationController
    
    def index
        @bo = Board.find(params[:id])
        @pro = @bo.profile_id

    end
    
    def comments
        @bo = Board.find(params[:id])
        @bo.comments.create(body:params[:body])
        redirect_to :back
    end
    
    def new
        @board = Board.new
        
        # 해시태그세번 입력하도록 설정
        # 동적으로 추가할 수 있도록 나중에 개선해보자
        3.times { @board.hashtags.new }
    end
 
    def create
        @board = Board.new(board_params)
        @board.profile_id = params[:profile_id]
        @board.title = params[:board][:title]
        @board.content = params[:board][:content]
  
    # 해시태그 처리 (Board)
         3.times do |x|
           # 날아오는 params 중 hashtag 관련 params를 받아온다. 인썸니아 강의 12:52
           tag = hashtag_params[:hashtags_attributes]["#{x}"]["title"]
           myHash = Hashtag.find_or_create_by(title: tag)
          
           @board.hashtags << myHash
         end
  
        @board.save
        @pro = @board.profile_id
        redirect_to "/profile/#{@pro}"

    end
    
    def edit
        @board = Board.find(params[:id])
    end
    
    def update
        @board = Board.find(params[:id])
        @board.title = params[:board][:title]
        @board.content = params[:board][:content]
        @board.save
        @pro = @board.profile_id
        redirect_to "/profile/#{@pro}"
    end

    def destroy
        @board = Board.find(params[:id])
        @board.destroy
        redirect_to(:back)
    end

# ---------------

    def lol
        #모든 롤 카테고리의 포스트를 보여주는 뷰
    end
    

    def maple
        #모든 메이플 카테고리의 포스트를 보여주는 뷰
    end
    
    def board_params
      params.require(:board).permit(:title, :contents, :image_url)
    end
    
private
    def hashtag_params
      params.require(:board).permit(hashtags_attributes: [:title])
    end
    
   
end
