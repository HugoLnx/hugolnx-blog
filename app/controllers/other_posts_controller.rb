class OtherPostsController < PostsBaseController
  rescue_from Infrastructure::PostException, :with => :redirect_to_not_founded

  def show
    location = params[:location]
    friendly_title = params[:id]
    @post = Post.find(:location => location, :friendly_title => friendly_title)

    @post_url = other_post_url(@post.location,@post.friendly_title)
    prepare_to_render_show_with @post

    @pagehead = PageHead.new :keywords => @post.keywords.join(','),
                             :description => @post.description,
                             :title_complement => @post.title,
                             :robots => @robots_metatag

    render :template => 'posts/show'
  end

private
  def redirect_to_not_founded
    redirect_to "/nao-encontrado"
  end
end
