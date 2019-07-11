class ApplicationController < ActionController::API

 rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
# rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

 def render_unprocessable_entity_response(exception)
   render json: exception.record.errors, status: :unprocessable_entity
 end

 # def render_not_found_response(exception)
 #   render json: { error: exception.message }, status: :not_found
 # end


rescue_from(ActiveRecord::RecordNotFound) do |pme|
  render json: pme.record.errors, status: :unprocessable_entity
end

 ActionController::Parameters.action_on_unpermitted_parameters = :raise

  rescue_from(ActionController::UnpermittedParameters) do |pme|
    render json: { error:  { unknown_parameters: pme.params } },
               status: :bad_request
  end
end
