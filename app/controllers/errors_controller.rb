#encoding: utf-8
class ErrorsController < ApplicationController
  def call_ajax
    redirect_to "/##{params[:tryied_path]}"
  end

  def show
    error_message = params[:id]
    case error_message
    when Infrastructure::PostException::PostNotFoundedMessage
      @message = "O Post não foi encontrado."
    else
      @message = "Esta url não é válida."
    end
    render :layout => false
  end
end
