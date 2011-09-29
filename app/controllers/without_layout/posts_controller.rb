class WithoutLayout::PostsController < PostsBaseController
  layout nil

  def show
    id = params[:id].sub('/','').match(/\d+/)[0]
    @post = Post.find id
    @post_url = post_url(@post.friendly_id)

    prepare_to_render_show_with @post, @post_url

    render 'posts/show.html.erb'
    response.content_type = "application/json"
    response.body = {
      :body => response.body,
      :title => @post.title,
      :sharing_head => @sharing_head.to_hash
    }.to_json
  end
end
