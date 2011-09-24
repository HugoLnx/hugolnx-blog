class WithoutLayout::CommentsController < ApplicationController
  layout nil

  def edit
    @comment = Comment.find(params[:id])
    @post = @comment.post
    render :partial => 'form'
  end
end
