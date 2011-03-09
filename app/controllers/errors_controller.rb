#encoding: utf-8
class ErrorsController < ApplicationController
  def show
    response.status = 500
    error_message = params[:id]
    case error_message
    when Infrastructure::PostException::PostNotFoundedMessage
      @message = "O Post não foi encontrado"
    end
    render :layout => false
  end
end
