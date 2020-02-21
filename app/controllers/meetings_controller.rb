class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all
    @user = User.find(params[:user_id])
  end

  def new
    @meeting = Meeting.new
    @mentor = User.find(params[:user_id])
    @mentee = current_user
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.mentee = current_user
    @meeting.mentor = User.find(params[:user_id])
    @meeting.accepted = false
    if @meeting.save
      redirect_to user_meetings_path(current_user)
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
    redirect_to user_meetings_path(current_user)
  end

  def edit
    @meeting = Meeting.find(params[:id])
    @meeting.save
  end

  def confirm
    @meeting = Meeting.find(params[:id])
    @meeting.accepted = true
    @meeting.update(meeting_params)
    redirect_to user_meetings_path(current_user)
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
