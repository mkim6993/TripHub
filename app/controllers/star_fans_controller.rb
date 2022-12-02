class StarFansController < ApplicationController
  before_action :set_star_fan, only: %i[ show edit update destroy ]

  # GET /star_fans or /star_fans.json
  def index
    @star_fans = StarFan.all
  end

  # GET /star_fans/1 or /star_fans/1.json
  def show
  end

  # GET /star_fans/new
  def new
    @star_fan = StarFan.new
  end

  # GET /star_fans/1/edit
  def edit
  end

  # POST /star_fans or /star_fans.json
  def create
    @star_fan = StarFan.new(star_fan_params)

    respond_to do |format|
      if @star_fan.save
        format.html { redirect_to star_fan_url(@star_fan), notice: "Star fan was successfully created." }
        format.json { render :show, status: :created, location: @star_fan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @star_fan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /star_fans/1 or /star_fans/1.json
  def update
    respond_to do |format|
      if @star_fan.update(star_fan_params)
        format.html { redirect_to star_fan_url(@star_fan), notice: "Star fan was successfully updated." }
        format.json { render :show, status: :ok, location: @star_fan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @star_fan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /star_fans/1 or /star_fans/1.json
  def destroy
    @star_fan.destroy

    respond_to do |format|
      format.html { redirect_to star_fans_url, notice: "Star fan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def follow
    starfan = StarFan.where(star_id: params[:star], fan_id: params[:fan])
    if starfan == []
      StarFan.create(star_id: params[:star], fan_id: params[:fan])
    else 
      starfan.destroy_all
    end
    respond_to do |format|
      format.html { redirect_to request.referrer}
    end
  end

  def follows
    if params[:type] == 'follower'
      @follows = StarFan.where(star_id: params[:id]).pluck(:fan_id)
    elsif params[:type] == 'following'
      @follows = StarFan.where(fan_id: params[:id]).pluck(:star_id)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_star_fan
      @star_fan = StarFan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def star_fan_params
      params.require(:star_fan).permit(:star_id, :fan_id)
    end

 

end
