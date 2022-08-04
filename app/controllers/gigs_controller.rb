class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :update, :destroy, :set_completed]

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
    @gig.update(brand_name: params[:brand_name], creator_id: params[:creator_id], state: params[:state])

    if @gig.save
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

  def set_completed
    @gig.set_completed!

    render jsonapi: @gig
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
