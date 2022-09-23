class TripLocationsController < ApplicationController
  before_action :set_trip_location, only: %i[ show edit update destroy ]

  # GET /trip_locations or /trip_locations.json
  def index
    @trip_locations = TripLocation.all
  end

  # GET /trip_locations/1 or /trip_locations/1.json
  def show
  end

  # GET /trip_locations/new
  def new
    @trip_location = TripLocation.new
  end

  # GET /trip_locations/1/edit
  def edit
  end

  # POST /trip_locations or /trip_locations.json
  def create
    @trip_location = TripLocation.new(trip_location_params)

    respond_to do |format|
      if @trip_location.save
        format.html { redirect_to trip_location_url(@trip_location), notice: "Trip location was successfully created." }
        format.json { render :show, status: :created, location: @trip_location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trip_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trip_locations/1 or /trip_locations/1.json
  def update
    respond_to do |format|
      if @trip_location.update(trip_location_params)
        format.html { redirect_to trip_location_url(@trip_location), notice: "Trip location was successfully updated." }
        format.json { render :show, status: :ok, location: @trip_location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_locations/1 or /trip_locations/1.json
  def destroy
    @trip_location.destroy

    respond_to do |format|
      format.html { redirect_to trip_locations_url, notice: "Trip location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_location
      @trip_location = TripLocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_location_params
      params.require(:trip_location).permit(:location_id, :trip_id)
    end
end
