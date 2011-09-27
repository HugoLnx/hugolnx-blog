class PostsBaseController < ApplicationController
private
  def prepare_to_render_show_with(post)
    @comments = Comment.find_all_by_post_id(post.id)
    @comment = Comment.new
    prepare_for_layout
  end
end
