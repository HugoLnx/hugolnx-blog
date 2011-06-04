class PostsBaseController < ApplicationController
private
  def prepare_to_render_show_with(post)
    @comments = Comment.find_all_by_post_id(post.id)
    @comment = Comment.new
    @id_max = Post.id_max_in 'app/views/posts/posts/'
    @titles = Post.all_post_titles_in 'app/views/posts/posts/'
  end
end
