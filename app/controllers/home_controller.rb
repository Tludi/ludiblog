class HomeController < ApplicationController

  def index
    @home = true
    @categories = Category.all
    @posts = Post.all.limit(4)
    @allPosts = Post.order(:updated_at => :desc)
    @evenPosts = @allPosts.where("id % 2 = 0").limit(5)
    @oddPosts = @allPosts.where("id % 2 != 0").limit(5)
    @latestPost = Post.last

    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
end
