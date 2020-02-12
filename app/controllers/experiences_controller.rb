class ExperiencesController < ApplicationController
  before_action :me

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    if @experience.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to user_path(@user)
  end

  def index
  end

  private

  def me
    @user = current_user
  end

  def experience_params
    params.require(:experience).permit(%i[user skill years_of_experience])
  end
end
