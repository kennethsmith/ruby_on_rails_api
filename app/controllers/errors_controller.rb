class ErrorsController < ApplicationController::API

  before_action :authenticate_user
  include ActionController::Cookies

  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  private
  def authenticate_user
    render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user
  end

  def not_found
    render status: 404
  end

  def internal_server_error
    render status: 500
  end
end
