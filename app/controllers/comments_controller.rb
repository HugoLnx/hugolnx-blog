class CommentsController < ApplicationController
  def create
    params[:comment].merge!(params.select{|key| key == 'post_id'})
    comment = Comment.new params[:comment]
    comment.save
    if comment.errors.empty?
      redirect_to :action => :index
    else
      response.status = 500
      response.content_type = "text/plain"
      render :inline => comment.errors.keys.join(';;');
    end
  end

  def index
    post = Post.find params[:post_id], :in => "app/views/posts/posts/"
    @comments = post.comments
    render :layout => false
  end
end
