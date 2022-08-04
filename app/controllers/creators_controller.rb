class CreatorsController < ApplicationController
  before_action :set_creator, only: [:show, :update, :destroy]

  # GET /creators
  def index
    @creators = Creator.all

    if params[:sort]
      @creators = @creators.order(params[:sort])
    else
      params[:sort] = "id"  # TODO: Implement this default param more elegantly if there's any time left
    end

    if params[:sort_direction]
      @creators = @creators.order(params[:sort] => params[:sort_direction])
    end

    if params[:limit]
      @creators = @creators.limit(params[:limit])
    end

    if params[:offset]
      @creators = @creators.offset(params[:offset])
    end

    render jsonapi: @creators
  end

  # GET /creators/1
  def show
    render jsonapi: @creator, include: params[:include]
  end

  # POST /creators
  def create
    @creator = Creator.create(first_name: params[:first_name], last_name: params[:last_name])

    if @creator.save
      render jsonapi: @creator
    else
      render jsonapi: @creator.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /creators/1
  def update
    @creator.update(first_name: params[:first_name], last_name: params[:last_name])

    render jsonapi: "Updated creator ##{@creator.id}"
  end

  # DELETE /creators/1
  def destroy
    @creator.destroy

    render jsonapi: "Destroyed creator ##{@creator.id}"
  end

  # Only allow a trusted parameter "white list" through.
  def creator_params
    params.require(:creator).permit(:first_name, :last_name)
  end

  def set_creator
    @creator = Creator.find(params[:id])
  end
end
