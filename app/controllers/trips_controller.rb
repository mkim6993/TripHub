class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy ]

  # GET /trips or /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1 or /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  def branches
    @trip = Trip.find(params[:id])
  end

  # add a location from newly created trip
  def locations
    @trip = Trip.find(params[:id]) 
    @location = Location.new
  end

  # post method when new location is created from /trips/:id/locations
  def create_location
    trip_id = location_params["trip_id"]
    modified_location_params = location_params
    modified_location_params.extract!(:trip_id)

    puts "^^^^^^^^^^^^^^^^^"
    @location = Location.new(modified_location_params)
    puts "^^^^^^^^^^^^^^^^^"

    respond_to do |format|
      if @location.save
        TripLocation.create(trip_id: trip_id, location_id: @location.id)
        format.html { redirect_to "/trips/" << trip_id.to_s, notice: "Location was successfully created." }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips or /trips.json
  def create
    @trip = current_user.trips.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to trip_url(@trip), notice: "Trip was successfully created." }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
    
    TripUser.create(:user_id => current_user.id, :trip_id => @trip.id)
  end

  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to trip_url(@trip), notice: "Trip was successfully updated." }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    TripLocation.where(trip_id: @trip.id).destroy_all # destroy all TripLocations relationships related to trip
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: "Trip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:create_by, :trip_date, :title, :description, :upvotes, :shares, :public, :parent)
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:trip_id, :name, :description, :address, :contact, :price, :image, :open_times, images: [])
    end
end

