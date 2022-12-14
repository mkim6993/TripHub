class LocationsController < ApplicationController
  before_action :set_location, only: %i[ show edit update destroy ]

  # GET /locations or /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1 or /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations or /locations.json
  def create
    @location = Location.new(location_params)
    puts "^^^^^^^^^^^^^^^^^"
    puts location_params
    puts "^^^^^^^^^^^^^^^^^"

    respond_to do |format|
      if @location.save
        format.html { redirect_to "/trips", notice: "Location was successfully created." }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
         flash.now[:danger] = (@location.errors.full_messages.join("<br/>" + "\u2022").prepend(@location.errors.size.to_s + " Error".pluralize(@location.errors.size) + ": " + "<br/>" + "\u2022").html_safe).html_safe 
      end
    end
  end

  # PATCH/PUT /locations/1 or /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to location_url(@location), notice: "Location was successfully updated." }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
        flash.now[:danger] = (@location.errors.full_messages.join("<br/>" + "\u2022").prepend(@location.errors.size.to_s + " Error".pluralize(@location.errors.size) + ": " + "<br/>" + "\u2022").html_safe).html_safe
      end
    end
  end

  # DELETE /locations/1 or /locations/1.json
  def destroy
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url, notice: "Location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # search for a location 
  def search
    searchInput = params[:search]
    locations = Location.where("lower(name) LIKE ?", "%#{ searchInput.downcase }%")
    render json: locations
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:name, :description, :address, :contact, :price, :image, :open_times, images: [])
    end
    
end
