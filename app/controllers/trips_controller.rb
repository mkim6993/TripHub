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

  # GET /trips/1/edit
  def edit
  end

  # POST /trips or /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to trip_url(@trip), notice: "Trip was successfully created." }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    puts "SEARCH START"
    if params[:search].blank? && params[:filter].blank?
      redirect_to trips_path
      return
    elsif !params[:search].blank? && params[:filter].blank?
      @parameter = params[:search].downcase
      @results = Trip.all.where("lower(title) LIKE ?", "%#{@parameter}%")
      puts "HHHH"
      puts @results
      puts "bbbbb"
    elsif params[:search].blank? && !params[:filter].blank?
      @parameter = params[:filter].to_i
      @results = Trip.all.where("upvotes > ?", @parameter)
      puts @results
      puts "bbbbb"
    else
      @parameter1 = params[:search].downcase
      @parameter2 = params[:filter].to_i
      @results = Trip.all.where("lower(title) LIKE ? AND upvotes > ?", "%#{@parameter1}%", @parameter2 )
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
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
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



end
