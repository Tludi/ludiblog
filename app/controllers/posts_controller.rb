class PostsController < ApplicationController
  before_filter :check_if_logged_in, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_categories

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order(:updated_at => :desc)
    # @current_public_post = Post.where("status = '0'").last
    if Post.count != 0 
     @current_public_post = Post.last
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    if Post.count != 0 
     @current_public_post = Post.last
    end
  end

  # GET /posts/new
  def new
    # @post = Post.new
    @user = User.find(session[:user_id])
    @post = @user.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.build(post_params) # use build with nested models
    # @post = @user.posts.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
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

    def set_categories
      @categories = Category.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :category_id, :user_id, :status, :featuretext, :fonticon, :postimageurl)
    end

    def check_if_logged_in
      unless logged_in?
        render_404 
      end
    end

    def render_404
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
        format.xml  { head :not_found }
        format.any  { head :not_found }
      end
    end

end
