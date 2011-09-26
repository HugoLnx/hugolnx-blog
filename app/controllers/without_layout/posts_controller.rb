class WithoutLayout::PostsController < PostsBaseController
  layout nil

  def show
    id = params[:id].sub('/','').match(/\d+/)[0]
    @post = Post.find id
    prepare_to_render_show_with @post
    render 'posts/show'
    response.headers['title'] = @post.title
  end
end
