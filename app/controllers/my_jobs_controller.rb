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
      if @job.save
         redirect_to my_jobs_path, notice: "Thank you, you have accepted"
      end
    end

    if params[:status] == "pending"
      @job.status = 1
      if @job.destroy
        redirect_to my_jobs_path, notice: "Thanks, you have cancelled your request"
     end
    end

    if params[:status] == "cancelar"
      @job.status = 4
      if @job.save
         redirect_to my_jobs_path, notice: "You have declined the applicant"
      end
    end
  end


end
