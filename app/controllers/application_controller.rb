class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    
   helper_method :current_user, :logged_in? 

def cities
  render json: CS.cities(params[:state], :us).to_json
end
    
    
def current_user
  @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
end
    
def logged_in?
 !!current_user
end

def require_user
 if !logged_in?
   flash[:danger] = "You must be logged in to perform that action"
   redirect_to root_path
  end
end    

end
