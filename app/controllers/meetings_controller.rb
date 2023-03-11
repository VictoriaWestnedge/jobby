class MeetingsController < ApplicationController
# app/controllers/pages_controller.rb
  def index
    # Scope your query to the dates being shown:

    @jobs = Job.where(user_id: current_user)

    # For a monthly view:
    @meetings = Meeting.where(user_id: current_user)
  end
  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user_id = current_user.id
    if @meeting.save
      redirect_to meetings_path, notice: 'Meeting was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time)
  end

end
