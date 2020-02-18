class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @image = User.all.first.photo.key
  end




  def user_params
    params.require(:user).permit(:name, :description, :linkedin_account, :github_account, :photo)
  end

end

