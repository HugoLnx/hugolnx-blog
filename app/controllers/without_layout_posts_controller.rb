class WithoutLayoutPostsController < PostsBaseController
  layout nil
  append_view_path 'views/posts/'

  def show
    id = params[:id]
    @post = Post.find id, :in => 'app/views/posts/posts/'
    prepare_to_render_show_with @post
    render 'posts/show'
  end
end
