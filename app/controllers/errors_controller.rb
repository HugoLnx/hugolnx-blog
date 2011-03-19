#encoding: utf-8
class ErrorsController < ApplicationController
  def call_ajax
    redirect_to "/##{params[:message]}"
  end

  def show
    error_message = params[:id]
    @message = select_pretty_message_for error_message
    render :layout => false
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
