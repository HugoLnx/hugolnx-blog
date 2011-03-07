class PostsController < ApplicationController
  def show
    id = params[:id]
    @post = Post.find id
    render :inline => @post.body, :layout => true
  end
end
