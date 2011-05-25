#encoding: utf-8
class PostsController < ApplicationController
  rescue_from Infrastructure::PostException, :with => :to_error

  def index
    params[:id] = Post.id_max_in 'app/views/posts/posts/'
    show
  end
  
  def show
    id = params[:id].to_i
    @post = Post.find id, :in => 'app/views/posts/posts/'
    @comments = Comment.find_all_by_post_id(@post.id)
    @comment = Comment.new
    @id_max = Post.id_max_in 'app/views/posts/posts/'
    @titles = Post.all_post_titles_in 'app/views/posts/posts/'
    if params[:without_layout] == 'true'
      render 'show', :layout => false
    else
      render 'show', :layout => true
    end
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

private
  def to_error(exception)
    @id_max = Post.id_max_in 'app/views/posts/posts/'
    @post = Post.find @id_max, :in => 'app/views/posts/posts/'
    @titles = Post.all_post_titles_in 'app/views/posts/posts/'
    error_message = exception.message
    @message = select_pretty_message_for error_message
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
