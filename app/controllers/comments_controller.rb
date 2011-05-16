class CommentsController < ApplicationController
  def create
    comment = Comment.new params[:comment]
    comment.save
    if comment.errors.empty?
      @comments = comment.post.comments
      render :partial => 'index', :layout => false
    else
      render :text => comment.errors.keys.join(';;'),
             :status => 500
    end
  end
end
