# encoding: utf-8
class ErrorsController < ApplicationController
  def show
    @id_max = Post.id_max
    @post = Post.find @id_max
    @titles = Post.all_post_titles
    error_message = params[:message]
    @message = select_pretty_message_for error_message
    @pagehead = PageHead.of_error
    render "errors/show"
  end

private

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
