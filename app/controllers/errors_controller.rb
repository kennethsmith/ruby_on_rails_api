class ErrorsController < ApplicationController
  skip_before_action :authenticate_user, raise: false

  def not_found
    render json: { error: 'Not Found' }, status: :not_found
  end

  def internal_server_error
    render json: { error: 'Internal Server Error' }, status: :internal_server_error
  end

  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def authenticate_user
    render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user
  end
end