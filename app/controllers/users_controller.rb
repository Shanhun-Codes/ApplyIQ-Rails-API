class UsersController < ApplicationController
def index
  @users = User.all
  Rails.logger.debug "Users loaded: #{@users.inspect}"
  render json: @users, status: :ok
end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: "User created successfully", user: @user }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def update
    @user = User.find(params[:id])
    @user.profile_picture.attach(params[:profile_picture])
    if @user.save
      render json: { message: "File uploaded successfully", file_url: url_for(@user.profile_picture) }, status: :ok
    else
      render json: { message: "Failed to upload file" }, status: :unprocessable_entity
    end
  end

  def user_params
  params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
