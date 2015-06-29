class HomeController < ApplicationController

  def index
    @categories = Category.all
    @posts = Post.all.limit(4)
    @allPosts = Post.all
    @evenPosts = Post.where("id % 2 = 0").limit(5)
    @oddPosts = Post.where("id % 2 != 0").limit(5)
    @latestPost = Post.latest
  end
end
