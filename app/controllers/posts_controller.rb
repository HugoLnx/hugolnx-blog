#encoding: utf-8
class PostsController < ApplicationController
  rescue_from Infrastructure::PostException, :with => :to_error

  def index
    id = Post.id_max_in 'app/views/posts/posts/'
    post = Post.find id, :in => 'app/views/posts/posts/'
    params[:id] = id
    params[:friendly_title] = post.friendly_title
    @keywords = ['hugolnx','hugo','roque'].join(',')
    @description = "Um blog de Hugo Roque (a.k.a HugoLnx) que foi criado com a intenção de compartilhar conhecimentos adquiridos durante seus estudos pessoais e profissionais."
    @title_complement = 'Index' 
    show
  end
  
  # TODO: Improve this action
  def show
    friendly_title = params[:friendly_title]
    id = params[:id].to_i
    with_layout = params[:without_layout] != 'true'
    @post = Post.find id, :in => 'app/views/posts/posts/'
    # TODO: Improve this crap
    if with_layout
      if friendly_title.nil?
        return redirect_to "/#{@post.to_url}"
      elsif friendly_title != @post.friendly_title
        raise Infrastructure::PostException, Infrastructure::PostException::PostNotFoundedMessage
      end
    end
    @keywords ||= @post.keywords.join(',')
    @description ||= @post.description
    @title_complement ||= @post.title
    @comments = Comment.find_all_by_post_id(@post.id)
    @comment = Comment.new
    @id_max = Post.id_max_in 'app/views/posts/posts/'
    @titles = Post.all_post_titles_in 'app/views/posts/posts/'
    render 'show', :layout => with_layout
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
