class WithoutLayout::OtherPostsController < PostsBaseController
  layout nil

  def show
    location = params[:location]
    friendly_title = params[:id]
    @post = Post.find(:location => location, :friendly_title => friendly_title)
    @post_url = post_url @post.friendly_id

    prepare_to_render_show_with @post, @post_url

    render 'posts/show'
    response.headers['title'] = @post.title
  end
end
