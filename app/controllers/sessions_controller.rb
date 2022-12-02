class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      reset_session
      log_in user
      flash[:success] = "Successful login"
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      # Create an error message.
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    flash.now[:success] = "Successful logout"
    log_out
    redirect_to root_url, status: :see_other
  end

end
