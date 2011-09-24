class CommentsController < ApplicationController
  def create
    comment = Comment.new params[:comment]
    comments = Comment.find_all_by_post_id(comment.post.id)
    comment.save if comments.empty? || current_user != comments.last.user
    if comment.errors.empty?
      @comments = Comment.find_all_by_post_id(comment.post.id)
      render :partial => 'without_layout/comments/index', :layout => false
    else
      render :text => comment.errors.keys.join(';;'),
             :status => 500
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment]) if @comment.user == current_user
    if @comment.errors.empty?
      @comments = Comment.find_all_by_post_id(@comment.post.id)
      render :partial => 'without_layout/comments/index', :layout => false
    else
      render :text => @comment.errors.keys.join(';;'),
             :status => 500
    end
  end
end
