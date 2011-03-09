class PostsController < ApplicationController
  rescue_from Infrastructure::PostException, :with => :to_error
  
  def index
    @id_max = Post.id_max_in 'app/views/posts/posts/'
    @titles = Post.all_post_titles_in 'app/views/posts/posts/'
    redirect_to "/##{params[:id]}" if params.has_key? :id
  end

  def show
    id = params[:id].to_i
    @post = Post.find id, :in => 'app/views/posts/posts/'
    render :layout => false
  end

private
  def to_error(exception)
    redirect_to :controller => :errors, :action => :show, :id => exception.message
  end
end
