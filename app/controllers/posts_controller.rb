class PostsController < ApplicationController
  def show
    id = params[:id]
    @post = Post.find id
    render Dir["app/views/posts/#{sprintf('%.3d',@post.id)}-*"].first
  end
end
