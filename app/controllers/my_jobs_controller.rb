class MyJobsController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @my_job = MyJob.create(user:current_user, job:@job)
    redirect_to jobs_path
  end
end
