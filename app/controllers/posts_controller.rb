class PostsController < ApplicationController
  rescue_from Infrastructure::PostException, :with => :to_error
  
  def call_ajax
    redirect_to "/##{params[:id]}" 
  end

  def show
    id = params[:id].to_i
    @post = Post.find id, :in => 'app/views/posts/posts/'
    @comments = @post.comments
    render :layout => false
  end

  def master_layout
    @id_max = Post.id_max_in 'app/views/posts/posts/'
    @titles = Post.all_post_titles_in 'app/views/posts/posts/'
    render :nothing => true, :layout => true
  end

private
  def to_error(exception)
    redirect_to :controller => :errors, :action => :show, :id => exception.message
  end
end
