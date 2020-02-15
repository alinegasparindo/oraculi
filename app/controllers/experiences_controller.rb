class ExperiencesController < ApplicationController
  before_action :me

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    if @experience.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def update
    # @user_exp = current_user.experiences
    # @experience = Experience.find(params[:id])
    # @experience.update(experience_params)
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to user_path(@user)
  end

  private

  def me
    @user = current_user
  end

  def experience_params
    params.require(:experience).permit(%i[user_id skill_id years_of_experience])
  end
end
