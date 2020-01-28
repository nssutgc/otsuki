class ApplicationController < ActionController::Base

before_action:current_user

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  def forbid_user
    if @current_user == nil
      flash[:notice] = "ログインして下さい"
    redirect_to("/")
    end
  end

end
