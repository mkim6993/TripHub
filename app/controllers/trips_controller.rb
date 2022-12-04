class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token # make ajax request work csrf

  # GET /trips or /trips.json
  def index
    @trips = Trip.all.paginate(:page => params[:page], :per_page => 6)
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

  def new_child
    @trip = Trip.find(params[:id])
  end

  # add a location from newly created trip
  def locations
    @trip = Trip.find(params[:id]) 
    @location = Location.new
  end

  def add_user
    puts params[:id]
    # TripUser.create(:user_id => params[:user_id], :trip_id => params[:id].id)
  end

  # post method when new location is created from /trips/:id/locations
  def create_location
    trip_id = location_params["trip_id"]
    modified_location_params = location_params
    modified_location_params.extract!(:trip_id)

    puts "^^^^^^^^^^^^^^^^^"
    puts trip_id
    puts modified_location_params
    @location = Location.new(modified_location_params)
    puts @location.id
    puts "^^^^^^^^^^^^^^^^^"

    respond_to do |format|
      if @location.save
        TripLocation.create(trip_id: trip_id, location_id: @location.id)
        format.html { redirect_to "/trips/" << trip_id.to_s, notice: "Location was successfully added." }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { redirect_to trip_locations_path, id: trip_id, :locals=> {:location=> @location}, status: :unprocessable_entity }
        puts "controller_________________________________"
        puts @location.errors
        puts @location.name
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # post method to add searched location to Trip
  def add_search_location
    location_id = params[:location_id]
    trip_id = params[:trip_id]
    @trip_location = TripLocation.new(trip_id: trip_id, location_id: location_id)

    respond_to do |format|
      if @trip_location.save
        format.js { render :js => "window.location.href ='/trips/" + trip_id.to_s + "'"}
      else
        puts "failed ajax"
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
        flash.now[:danger] = (@trip.errors.full_messages.join("<br/>" + "\u2022").prepend(@trip.errors.size.to_s + " Error".pluralize(@trip.errors.size) + ": " + "<br/>" + "\u2022").html_safe).html_safe 
      end
    end
    
    TripUser.create(:user_id => current_user.id, :trip_id => @trip.id)
  end

  def search
    if params[:month].blank? || params[:day].blank? || params[:year].blank?
      @results = Trip.where("lower(title) LIKE ?", "%#{params[:name].downcase}%").and(Trip.where("upvotes >= ?", params[:saves].to_i)) 
    else 
      @results = Trip.where("lower(title) LIKE ?", "%#{params[:name].downcase}%").and(Trip.where("upvotes >= ?", params[:saves].to_i)).and(Trip.where("trip_date > ?", params[:year] + "-" + params[:month] + "-" + params[:day]))
    end
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
        flash.now[:danger] = (@trip.errors.full_messages.join("<br/>" + "\u2022").prepend(@trip.errors.size.to_s + " Error".pluralize(@trip.errors.size) + ": " + "<br/>" + "\u2022").html_safe).html_safe 
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

