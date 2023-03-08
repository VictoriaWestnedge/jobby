class MyJobsController < ApplicationController

  def index
    @my_jobs = MyJob.where(user_id: current_user)
    @my_published_jobs = Job.where(user: current_user)

  end

  def create
    @job = Job.find(params[:job_id])
    @my_job = MyJob.create(user:current_user, job:@job)
    redirect_to jobs_path
  end
end
