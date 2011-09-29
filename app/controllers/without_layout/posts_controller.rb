module WithoutLayout
  class PostsController < PostsBaseController
    layout nil

    def show
      id = params[:id].sub('/','').match(/\d+/)[0]
      @post = Post.find id
      @post_url = post_url(@post.friendly_id)

      prepare_to_render_show_with @post, @post_url
      render_json_to_page_changes
    end
  end
end
