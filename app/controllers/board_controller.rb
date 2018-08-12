class BoardController < ApplicationController
    
    def index
        @board = Board.where(profile_id: params[:user_id])
        @board_user = (params[:user_id])
        @bo = Board.find(params[:id])
        @temp = params[:profile_id]
        
    end
    
    def new
        @board = Board.new
        @temp = params[:profile_id]
        
        # 해시태그세번 입력하도록 설정
        # 동적으로 추가할 수 있도록 나중에 개선해보자
    
        3.times { @post.hashtags.new }
    end
 
    def create
        @board = Board.new
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
        
        respond_to do |format|
          if @board.save
            format.html { redirect_to posts_path, notice:"게시물이 성공적으로 작성되었습니다."}
            format.json { render :show, status: :created, location: @board }
          else
            format.html { render :new }
            format.json { render json: @board.errors , status: :unprocessable_entity }
          end
        end 
    end
    
    def edit
        @board = Board.find(params[:id])
    end
    
    def update
        @board = Board.find(params[:id])
        @board.title = params[:board][:title]
        @board.content = params[:board][:content]
        @board.save
        @board.profile_id = params[:profile_id]
        
        redirect_to 
    end

    def show
        @board = Board.find(params[:id])
    #    @temp = @board.profile.user_id
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
    
     
    def hashtag_params
      params.require(:board).permit(hashtags_attributes: [:title])
    end
end
