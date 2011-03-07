class PostsController < ApplicationController
  def show
    id = params[:id]
    @post = Post.find id, :in => 'app/views/posts/posts/'
  end

  def index
    @posts = Post.all_in 'app/views/posts/posts'
  end
end
