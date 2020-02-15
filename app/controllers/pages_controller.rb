class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @users = User.where(skill: params[:query])
      sql_query = " \
        users.name ILIKE :query \
        OR experiences.first_name ILIKE :query \
        OR skills.last_name ILIKE :query \
      "
      @users = User.joins(:skill).where(sql_query, query: "%#{params[:query]}%")
    else
      @users = User.all
    end
   @skills = Skill.all
   #  if params[:query].present?
   #    sql_query = " \
   #      user.skills ILIKE :query \
   #      OR directors.first_name ILIKE :query \
   #      OR directors.last_name ILIKE :query \
   #    "
   #    @users = User.joins(:experiences, :skills).where(sql_query, query: "%#{params[:query]}%")
   #  else
   #    @users = User.all
  	# end
  end

  def profile
    @user = User.find(params[:id])
  end
end
