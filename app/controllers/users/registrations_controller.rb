class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def sign_up(resource_name, resource)
    # Prevents session write (sign_in would throw DisabledSessionError)
    # Remove or leave blank
  end

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { message: "User created successfully", user: resource }, status: :created
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
