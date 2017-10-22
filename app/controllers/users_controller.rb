class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :require_same_user, only: [:edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end
    
def new
  session[:user_params] ||= {}
  @user = User.new(session[:user_params])
  @user.current_step = session[:user_step]
end

def create
  session[:user_params].deep_merge!(params[:user]) if params[:user]
  @user = User.new(session[:user_params])
  @user.current_step = session[:user_step]
  if @user.valid?
    if params[:back_button]
      @user.previous_step
    elsif @user.last_step?
      @user.save if @user.all_valid?
    else
      @user.next_step
    end
    session[:user_step] = @user.current_step
  end
  if @user.new_record?
    render "new"
  else
    session[:user_step] = session[:user_params] = nil
    flash[:notice] = "user saved!"
    redirect_to @user
  end
end
    def edit
  end
    
  # GET /users/new
=begin
      def new
    @user = User.new
  end

  # GET /users/1/edit
 

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
=end
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

def require_same_user
    if current_user != @user
    flash[:danger] = "You can only edit your own account"
    redirect_to root_path
    end

  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :sex, :age, :dob, :city , :country , :language , :occupation , :education , :height_feet , :height_inch)
    end
    
    
end
