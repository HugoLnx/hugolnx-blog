class PostsController < ApplicationController
  def show
    id = params[:id]
    html_lines = File.readlines Dir["app/views/posts/#{sprintf('%.3d',id)}-*"].first
    @title = html_lines.first.gsub!(/[tT]itle:( *|)/,"")
    html_lines.delete_at 0
    @body = html_lines.join.strip
    render :inline => @body, :layout => true
  end
end
