class HomeController < ApplicationController
  def index
    @categories = Category.all
    @posts = Post.all.limit(4)
  end
end
