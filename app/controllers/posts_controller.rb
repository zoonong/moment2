class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /posts
  # GET /posts.json
  
  def mypage
  end
  
  def index
    @posts = Post.all.reverse
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    
    # 해시태그세번 입력하도록 설정
    # 동적으로 추가할 수 있도록 나중에 개선해보자
    
    3.times { @post.hashtags.new }
   
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    
    # 해시태그 처리
    3.times do |x|
      # 날아오는 params 중 hashtag 관련 params를 받아온다. 인썸니아 강의 12:52
      tag = hashtag_params[:hashtags_attributes]["#{x}"]["title"]
      myHash = Hashtag.find_or_create_by(title: tag)
      
      @post.hashtags << myHash
    end
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice:"게시물이 성공적으로 작성되었습니다."}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors , status: :unprocessable_entity }
      end
    end
  end


  
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
    
    def hashtag_params
      params.require(:post).permit(hashtags_attributes: [:title])
    end
end
