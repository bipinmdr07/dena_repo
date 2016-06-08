class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    render layout: "layouts/blog"
  end
end
