class TripUsersController < ApplicationController
  before_action :set_trip_user, only: %i[ show edit update destroy ]

  # GET /trip_users or /trip_users.json
  def index
    @trip_users = TripUser.all
  end

  # GET /trip_users/1 or /trip_users/1.json
  def show
  end

  # GET /trip_users/new
  def new
    @trip_user = TripUser.new
  end

  # GET /trip_users/1/edit
  def edit
  end

  # POST /trip_users or /trip_users.json
  def create
    @trip_user = TripUser.new(trip_user_params)

    respond_to do |format|
      if @trip_user.save
        format.html { redirect_to trip_user_url(@trip_user), notice: "Trip user was successfully created." }
        format.json { render :show, status: :created, location: @trip_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trip_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trip_users/1 or /trip_users/1.json
  def update
    respond_to do |format|
      if @trip_user.update(trip_user_params)
        format.html { redirect_to trip_user_url(@trip_user), notice: "Trip user was successfully updated." }
        format.json { render :show, status: :ok, location: @trip_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_users/1 or /trip_users/1.json
  def destroy
    @trip_user.destroy

    respond_to do |format|
      format.html { redirect_to trip_users_url, notice: "Trip user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_user
      @trip_user = TripUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_user_params
      params.require(:trip_user).permit(:trip_id, :user_id)
    end
end
