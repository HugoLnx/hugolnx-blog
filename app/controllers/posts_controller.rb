#encoding: utf-8
class PostsController < PostsBaseController
  rescue_from Infrastructure::PostException, :with => :to_error

  def index
    id = Post.id_max_in 'app/views/posts/posts/'
    post = Post.find id, :in => 'app/views/posts/posts/'
    params[:id] = post.friendly_id
    @keywords = ['hugolnx','hugo','roque'].join(',')
    @description = "Um blog de Hugo Roque (a.k.a HugoLnx) que foi criado com a intenção de compartilhar conhecimentos adquiridos durante seus estudos pessoais e profissionais."
    @title_complement = 'Index' 
    show
    render :show
  end

  def redirect_to_right_path
    id = params[:id]
    post = Post.find id, :in => 'app/views/posts/posts/'
    redirect_to post
  end
  
  def show
    friendly_id = params[:id]
    id = friendly_id[/\d+/]
    @post = Post.find id, :in => 'app/views/posts/posts/'
    redirect_to @post if friendly_id != @post.friendly_id
    
    prepare_to_render_show_with @post

    @keywords ||= @post.keywords.join(',')
    @description ||= @post.description
    @title_complement ||= @post.title
  end

  def feed
    @posts = []
    id_max = Post.id_max_in('app/views/posts/posts/')
    (1..id_max).each do |id|
      @posts << Post.find(id, :in => 'app/views/posts/posts')
    end

    respond_to do |format|
      format.rss { render 'feed', :layout => false }
    end
  end

  def sitemap
    @posts = []
    id_max = Post.id_max_in('app/views/posts/posts/')
    (1..id_max).each do |id|
      @posts << Post.find(id, :in => 'app/views/posts/posts')
    end

    respond_to do |format|
      format.xml { render 'sitemap', :layout => false }
    end
  end

private
  def to_error(exception)
    @id_max = Post.id_max_in 'app/views/posts/posts/'
    @post = Post.find @id_max, :in => 'app/views/posts/posts/'
    @titles = Post.all_post_titles_in 'app/views/posts/posts/'
    error_message = exception.message
    @message = select_pretty_message_for error_message
    @robots_metatag = 'noindex'
    @title_complement = 'Error'
    render "errors/show"
  end

  def select_pretty_message_for(error_message)
    case error_message
    when Infrastructure::PostException::PostNotFoundedMessage
      "O Post não foi encontrado."
    when 'invalid_credentials'
      "Suas credenciais estão incorretas"
    when 'timeout'
      "Não foi possivel conectar ao twitter"
    else
      "Esta url não é válida."
    end
  end
end
