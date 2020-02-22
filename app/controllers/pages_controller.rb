class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @users = User.search_user_by_skill(params[:query]).sort_by { |user| user.experiences.search_experience_by_skill(params[:query]).first.years_of_experience }.reverse
      @params = params[:query]
    else
      @users = User.all
    end
    @skills = Skill.all
    @image = User.all.first.photo.key
  end

  def profile
    @user = User.find(params[:id])
  end
end
