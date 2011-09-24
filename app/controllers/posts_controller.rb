#encoding: utf-8
class PostsController < PostsBaseController
  rescue_from Infrastructure::PostException, :with => :redirect_to_not_founded
  LOCATION = 'artigos'

  def index
    post = Post.find_all(:location => LOCATION).last
    params[:id] = post.friendly_id
    show
    @pagehead = PageHead.of_index
    render :show
  end

  def redirect_to_right_path
    id = params[:id]
    post = Post.find id
    redirect_to post
  end
  
  def show
    friendly_id = params[:id]
    @post = Post.find(:friendly_id => friendly_id, :location => LOCATION)
    url_is_correct = friendly_id == @post.friendly_id
    redirect_to '/nao-encontrado' unless url_is_correct
    
    prepare_to_render_show_with @post

    @pagehead = PageHead.new :keywords => @post.keywords.join(','),
                             :description => @post.description,
                             :title_complement => @post.title,
                             :robots => @robots_metatag
  end

  def feed
    @posts = Post.all

    respond_to do |format|
      format.rss { render 'feed', :layout => false }
    end
  end

  def sitemap
    @posts = Post.all

    respond_to do |format|
      format.xml { render 'sitemap', :layout => false }
    end
  end

private
  def redirect_to_not_founded
    redirect_to "/nao-encontrado"
  end
end
