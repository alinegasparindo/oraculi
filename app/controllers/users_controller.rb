class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.geocoded

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

