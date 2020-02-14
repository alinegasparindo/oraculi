class UsersController < ApplicationController
  def show


  end




  def user_params
    params.require(:user).permit(:name, :description, :linkedin_account, :github_account, :photo)
  end

end

