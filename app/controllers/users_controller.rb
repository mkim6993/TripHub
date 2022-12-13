class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    @abc = 1
    user_trips = @user.trips
    @trips = user_trips
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def search
    users = User.where("username LIKE ? OR name LIKE ? OR email LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    render json: users
  end

  def trips
    @user = User.find(params[:id])
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        reset_session
        log_in @user
        format.html { redirect_to user_url(@user), success: "Sign up successful" }
        format.json { render :show, status: :created, location: @user }
        flash.now[:success] = "Sign up successful"
        UserMailer.with(user: @user).signup_email.deliver_now
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        flash.now[:danger] = (@user.errors.full_messages.join("<br/>" + "\u2022").prepend(@user.errors.size.to_s + " Error".pluralize(@user.errors.size) + ": " + "<br/>" + "\u2022").html_safe).html_safe 
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    puts "DESTORY"
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :name, :email, :user_slogen, :password, :password_confirmation)
    end

    

end
