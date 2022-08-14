class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :update, :destroy]

  # GET /gigs
  def index
    @gigs = Gig.all

    render jsonapi: @gigs
  end

  # GET /gigs/1
  def show
    render jsonapi: @gig, include: params[:include]
  end

  # POST /gigs
  def create
    @gig = Gig.create(brand_name: params[:brand_name], creator_id: params[:creator_id])

    if @gig.save
      render jsonapi: @gig
    else
      render jsonapi: @gig.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gigs/1
  def update
    if @gig.update(gig_params)
      render jsonapi: "Updated gig ##{@gig.id}"
    else
      render jsonapi: @gig.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gigs/1
  def destroy
    @gig.destroy

    render jsonapi: "Destroyed gig ##{@gig.id}"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gig
    @gig = Gig.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def gig_params
    params.require(:gig).permit(:brand_name, :state, :creator_id)
  end
end
