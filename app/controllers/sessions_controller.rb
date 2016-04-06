class SessionsController < ApplicationController
  # def create
  #   binding.pry
  #   render text: request.env["omniauth.auth"].inspect
  # end

  def create
  if user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
  end
  flash[:now] = "You've logged in!"
  redirect_to root_path
end

  def destroy
    session.clear
    flash[:now] = "You've logged out!"
    redirect_to root_path
  end

end
