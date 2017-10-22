class SessionsController < ApplicationController

def create

user = User.find_by(email: params[:session][:email].downcase)

if user && user.authenticate(params[:session][:password])

    if params[:remember_me]
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = user.auth_token
    end
    redirect_to user_path(user)
    flash[:success] = "You have successfully logged in"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end    



def destroy
cookies.delete(:auth_token)
session[:user_id] = nil

flash[:success] = "You have logged out"

redirect_to root_path

end
    


  
    
end    