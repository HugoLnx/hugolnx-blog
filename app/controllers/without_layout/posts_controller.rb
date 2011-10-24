module WithoutLayout
  class PostsController < PostsBaseController
    layout nil

    def show
      friendly_id = params[:id]
      @post = Post.find :friendly_id => friendly_id
      @post_url = post_url(@post.friendly_id)

      prepare_to_render_show_with @post, @post_url
      render_json_to_page_changes
    end
  end
end
