class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    @user.profile_picture.attach(params[:profile_picture])
    if @user.save
      render json: { message: "File uploaded successfully", file_url: url_for(@user.profile_picture)}, status: :ok
    else
      render json: {message: "Failed to upload file"}, status: :unprocessable_entity
    end
  end
end
