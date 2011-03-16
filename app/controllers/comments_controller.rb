class CommentsController < ApplicationController
  def create
    params[:comment].merge!(params.select{|key| key == 'post_id'})
    p params[:comment]
    comment = Comment.new params[:comment]
    comment.save
    if comment.errors.empty?
      redirect_to :action => :index
    else
      response.status = 500
      javascript = ""
      comment.errors.each do |field|
        javascript += "$('form#comment [name=\"comment[#{field}]\"]').addClass('field_error');"
      end
      render :inline => javascript
    end
  end

  def index
    post = Post.find params[:post_id], :in => "app/views/posts/posts/"
    @comments = post.comments
    render :layout => false
  end
end
