class PostsController < ApplicationController
  def show
    @post = Post.friendly.find(params[:id])

    render layout: "layouts/blog"
  end
end
