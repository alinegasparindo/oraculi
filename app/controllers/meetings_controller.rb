class MeetingsController < ApplicationController

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @user = current_user
    if @meeting.save
      redirect_to meeting_path(@meeting)
    else
      render :new
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to meetings_path
  end

  def edit
    @meeting = Meeting.find(params[:id])
    @meeting.save
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update(meeting_params)
  end

  private

  def meeting_params
    params.require(:meeting).permit(:start_time, :end_time, :location, :accepted, :mentor, :mentee)
  end
end
