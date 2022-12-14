class GigPaymentsController < ApplicationController
  before_action :set_gig_payment, only: [:show, :update, :destroy]

  # GET /gig_payments
  def index
    @gig_payments = GigPayment.all

    render jsonapi: @gig_payments
  end

  # GET /gig_payments/1
  def show
    render jsonapi: @gig_payment
  end

  # POST /gig_payments
  def create
    @gig_payment = GigPayment.create(gig_id: params[:gig_id])

    render jsonapi: @gig_payment
  end

  # PATCH/PUT /gig_payments/1
  def update
    @gig_payment.update(gig_id: params[:gig_id], state: params[:state])

    render jsonapi: "Updated gig payment ##{@gig_payment.id}"
  end

  # DELETE /gig_payments/1
  def destroy
    @gig_payment.destroy

    render jsonapi: "Destroyed gig payment ##{@gig_payment.id}"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gig_payment
    @gig_payment = GigPayment.find(params[:id])
  end
end
