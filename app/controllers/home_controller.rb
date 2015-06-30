class HomeController < ApplicationController

  def index
    @categories = Category.all
    @posts = Post.all.limit(4)
    @allPosts = Post.order(:updated_at => :desc)
    @evenPosts = @allPosts.where("id % 2 = 0").limit(5)
    @oddPosts = @allPosts.where("id % 2 != 0").limit(5)
    @latestPost = Post.last
  end
end
