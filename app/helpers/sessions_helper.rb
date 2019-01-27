module SessionsHelper
  def log_out_button
    if @user == User.find_by(id: session[:user_id])
      link_to "Log Out", logout_path, method: "post"
    end
  end
end
