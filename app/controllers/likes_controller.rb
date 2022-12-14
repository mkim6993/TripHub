class LikesController < ApplicationController
  before_action :set_like, only: %i[ show edit update destroy ]

  # GET /likes or /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1 or /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes or /likes.json
  def create
    puts "CREATE LIKE"
    @like = Like.new(like_params)

    respond_to do |format|
      if @like.save
        format.html { redirect_to like_url(@like), notice: "Like was successfully created." }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /likes/1 or /likes/1.json
  def update
    puts "UPDATE LIKE"
    like = Like.where(user:current_user, trip: Trip.find(params[:trip]))
    if like == []
      Like.create(user:current_user, trip: Trip.find(params[:trip]))
      Trip.find(params[:trip]).update(upvotes: Like.where(trip: Trip.find(params[:trip])).count)
      Trip.find(params[:trip]).save
      # @like.save
    else
      like.destroy_all
      Trip.find(params[:trip]).update(upvotes: Like.where(trip: Trip.find(params[:trip])).count)
      Trip.find(params[:trip]).save
    end
    respond_to do |format|     
      format.html { redirect_to request.referrer}
      format.json { render :show, status: :ok, location: @like }
    end
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like.destroy

    respond_to do |format|
      format.html { redirect_to likes_url, notice: "Like was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:id, :user_id, :trip_id)
    end
end
