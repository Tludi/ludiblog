class HomeController < ApplicationController
  def index
    @categories = Category.all
    @posts = Post.all.limit(5)
  end
end
