class WithoutLayout::PostsController < PostsBaseController
  layout nil

  def show
    id = params[:id].sub('/','').match(/\d+/)[0]
    @post = Post.find id
    @post_url = post_url(@post.friendly_id)

    @sharing_head = Infrastructure::SharingServicesHead.new(
      :post => @post,
      :request => request,
      :url => @post_url
    )
    prepare_to_render_show_with @post
    render 'posts/show.html.erb'
    response.content_type = "application/json"
    response.body = {
      :body => response.body,
      :title => @post.title,
      :sharing_head => @sharing_head.to_hash
    }.to_json
  end
end
