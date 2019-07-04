class ApplicationController < ActionController::Base
  def current_user
  end

  def logged_in?
  end

  def ensure_logged_in #can sometimes be seen as require_signed_in
  end

  def login!
  end

  def logout!
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
