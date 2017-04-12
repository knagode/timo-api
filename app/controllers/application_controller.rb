class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session


  # response handlers
  def render_success status = :ok
    render :show, status: status
  end

  def render_errors errors
    render json: errors, status: :unprocessable_entity
  end
end
