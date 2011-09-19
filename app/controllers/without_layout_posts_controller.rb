class WithoutLayoutPostsController < PostsBaseController
  layout nil
  append_view_path 'views/posts/'

  def show
    id = params[:id].sub('/','').match(/\d+/)[0]
    @post = Post.find id
    prepare_to_render_show_with @post
    render 'posts/show'
  end
end
