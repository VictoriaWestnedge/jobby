class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @job = Job.find(params[:id])
    @my_jobs = Job.where(user: current_user)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:name, :adress, :description, :category, :qty_hour, :city, :price_per_hour, :start_date, :end_date, :start_time, :end_time)
  end
end
