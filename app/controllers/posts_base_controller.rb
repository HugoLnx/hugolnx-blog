class PostsBaseController < ApplicationController
private
  def prepare_to_render_show_with(post)
    @comments = Comment.find_all_by_post_id(post.id)
    @comment = Comment.new
    prepare_for_slider
  end

  def prepare_for_slider
    @id_max = Post.id_max
    @titles = Post.all_post_titles
    @links = links_from @titles
  end

  def links_from(titles)
    links = []
    titles.each_with_index do |title,i|
      links << "#{i+1}-#{title.to_slug.normalize}"
    end
    links
  end
end
