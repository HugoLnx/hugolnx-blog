class PostsBaseController < ApplicationController
private
  def prepare_to_render_show_with(post)
    @comments = Comment.find_all_by_post_id(post.id)
    @comment = Comment.new
    prepare_for_layout
  end

  def prepare_for_layout
    @tagged_posts = Infrastructure::PostsDateTagger.to_hash Post.find_all(:location => PostsController::LOCATION)
  end
end
