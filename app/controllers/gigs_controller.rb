class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :update, :destroy]

  # GET /gigs
  def index
    @gigs = Gig.all

    if params[:sort]
      @gigs = @gigs.order(params[:sort])
    end

    if params[:sort_direction]
      @gigs = @gigs.order(params[:sort] => params[:sort_direction])
    end

    if params[:limit]
      @gigs = @gigs.limit(params[:limit])
    end

    if params[:offset]
      @gigs = @gigs.offset(params[:offset])
    end

    render json: @gigs
  end

  # GET /gigs/1
  def show
    render json: @gig
  end

  # POST /gigs
  def create
    @gig = Gig.new(gig_params)

    if @gig.save
      render json: @gig, status: :created, location: @gig
    else
      render json: @gig.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gigs/1
  def update
    if @gig.update(gig_params)
      render json: @gig
    else
      render json: @gig.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gigs/1
  def destroy
    @gig.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gig
    @gig = Gig.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def gig_params
    params.require(:gig).permit(:title, :description, :price, :creator_id, :gig_category_id)
  end
end
