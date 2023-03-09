class MyJobsController < ApplicationController

  def index
    @my_jobs = MyJob.where(user_id: current_user)
    @my_published_jobs = Job.where(user: current_user)

  end

  def create

    @job = Job.find(params[:job_id])
    @my_job = MyJob.create(user:current_user, job:@job)
    redirect_to my_jobs_path, notice: "Thanks for applying to this job"
  end

  def change_status
    @job=MyJob.find(params[:format])
    if params[:status] == "aceptar"
      @job.status = 2
      @job.save
    else
      @job.status = 4
      @job.save
    end
  end


end
