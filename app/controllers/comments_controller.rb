class CommentsController < ApplicationController
  def create
    Comment.new(params[:comment]).save
    redirect_to :action => :index, :post_id => params[:post_id]
  end

  def index
    @comments = Comment.all
    render :layout => false
  end
end
