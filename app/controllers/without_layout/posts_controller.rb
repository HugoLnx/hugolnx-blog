class WithoutLayout::PostsController < PostsBaseController
  def show
    id = params[:id]
    @post = Post.find id, :in => 'app/views/posts/posts/'
    prepare_to_render_show_with @post
    render 'posts/show', :layout => false
  end
end
