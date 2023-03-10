class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    jobs_with_accepted_pending = MyJob.select(:job_id).distinct.where(status: "accepted").pluck(:job_id)
    # @jobs = Job.all
    @jobs =Job.where.not(id: jobs_with_accepted_pending)

    if params[:query].present?
      @jobs = @jobs.search_by_name_and_description_and_city(params[:query])

    end

      # @markers = @jobs.geocoded.map do |job|
      #   {
      #     lat: job.latitude,
      #     lng: job.longitude,
      #     info_window_html: render_to_string(partial: "info_window", locals: { job: job }, formats: [:html])
      #   }
      # end

      respond_to do |format|
        format.html
        format.text { render partial: "jobs/list", locals: { jobs: @jobs }, formats: [:html] }
      end
    end

    def show
      @job = Job.find(params[:id])
      @my_jobs = Job.where(user: current_user)
      flash[:message] = "Thanks for applying to the job"
      @markers =
        [{
          lat: @job.latitude,
          lng: @job.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: { job: @job }, formats: [:html])
        }]
    end

    def new
      @job = Job.new
    end

    def create
      @job = Job.new(job_params)
      @job.user_id = current_user.id
      if @job.save
        redirect_to jobs_path, notice: "Your job has been saved. Thank you!"
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
      redirect_to jobs_path, notice: "Your job has been updated. Thank you!"
    end


  def destroy
    @job = Job.find(params[:id])
    MyJob.where(job_id: @job.id).destroy_all

    @job.destroy
    redirect_to jobs_path, status: :see_other
  end

  private
  def job_params
    params.require(:job).permit(:name, :address, :description, :category, :qty_hour, :city, :price_per_hour, :start_date, :end_date, :start_time, :end_time, :photo)
  end
end
