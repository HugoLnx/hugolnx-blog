class PostsBaseController < ApplicationController
private
  def prepare_to_render_show_with(post,post_url)
    @comments = Comment.find_all_by_post_id(post.id)
    @comment = Comment.new

    @sharing_head = Infrastructure::SharingServicesHead.new(
      :post => post,
      :request => request,
      :url => post_url
    )
    prepare_for_layout
  end
end
