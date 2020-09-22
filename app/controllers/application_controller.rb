class ApplicationController < ActionController::API
  unless Rails.env.development?
    rescue_from Exception, with: :exception_handler
  end

  def exception_handler(exception)
    case exception
    when ActionController::UnknownFormat, ActionController::InvalidCrossOriginRequest
      render json: { error: 'Bad request' }, status: :unprocessable_entity
    when ActiveRecord::RecordNotFound, ActionController::UnknownController, ActionController::RoutingError
      render json: { error: 'Not found' }, status: :not_found
    else
      render json: { error: 'Internal error' }, status: :internal_server_error
    end
  end
end
