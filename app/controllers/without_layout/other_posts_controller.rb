module WithoutLayout
  class OtherPostsController < WithoutLayout::PostsBaseController
    layout nil

    def show
      location = params[:location]
      friendly_title = params[:id]
      @post = Post.find(:location => location, :friendly_title => friendly_title)
      @post_url = other_post_url @post.location, @post.friendly_title

      prepare_to_render_show_with @post, @post_url
      render_json_to_page_changes
    end
  end
end
