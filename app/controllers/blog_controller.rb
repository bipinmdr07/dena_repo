class BlogController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
    render layout: "layouts/blog"
  end
end
