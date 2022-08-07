class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  def handle_record_not_found(exception)
    render json: { error: exception.message }.to_json, status: :not_found
  end

  def handle_invalid_transition(exception)
    render json: { error: exception.message, traces: exception.backtrace }.to_json, status: :bad_request
  end

  def handle_internal_error(exception)
    render json: { error: exception.message }.to_json, status: :internal_server_error
  end

  rescue_from ::ActiveRecord::RecordNotFound, with: :handle_record_not_found
  rescue_from ::AASM::InvalidTransition, with: :handle_invalid_transition
  rescue_from ::NameError, with: :handle_internal_error
end
