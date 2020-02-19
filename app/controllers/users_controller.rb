class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @image = User.all.first.photo.key

    @markers = [@user].map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end


  def user_params
    params.require(:user).permit(:name, :description, :linkedin_account, :github_account, :photo)
  end

end

