class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index



    jobs_with_accepted_pending = MyJob.select(:job_id).distinct.where(status: "accepted").pluck(:job_id)
    # @jobs = Job.all
    @jobs =Job.where.not(id: jobs_with_accepted_pending)


    @jobs = @jobs.search_by_name_and_description_and_city(params[:category]) if params[:category].present?

      @jobs = @jobs.search_by_name_and_description_and_city(params[:query]) if params[:query].present?


      @jobs = @jobs.search_by_name_and_description_and_city(params[:city]) if params[:city].present?

      @jobs = @jobs.search_by_name_and_description_and_city(params[:price]) if params[:price].present?

      @jobs = @jobs.search_by_name_and_description_and_city(params[:date]) if params[:date].present?




    # @tournaments = policy_scope(Tournament.all)
    # @tournaments = policy_scope(@tournaments.where(category: params[:category])) if params[:category].present?
    # @tournaments = policy_scope(@tournaments.where(type: params[:type])) if params[:type].present?
    # @tournaments = policy_scope(@tournaments.where(type: params[:type])) if params[:type].present?
    # @tournaments = policy_scope(@tournaments.where(“price <= (?)“, params[:max_price])) if params[:max_price].present?
    # @tournaments = policy_scope(@tournaments.where(“start_date >= (?)“, params[:start_date])) if params[:start_date].present?
    # @tournaments = policy_scope(@tournaments.where(“end_date <= (?)“, params[:end_date])) if params[:end_date].present?
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
      flash[:message] = t("thanksforapplying")
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
        redirect_to my_jobs_path, notice: t("jobsaved")
      else

        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @job = Job.find(params[:id])
    end

    def update
      @job = Job.find(params[:id])
      @job.update(job_params)
      redirect_to my_jobs_path, notice: t("jobupdated")
    end

  def destroy
    @job = Job.find(params[:id])
    MyJob.where(job_id: @job.id).destroy_all

    @job.destroy
    redirect_to my_jobs_path, status: :see_other
  end

  private
  def job_params
    params.require(:job).permit(:name, :address, :description, :category, :qty_hour, :city, :price_per_hour, :start_date, :end_date, :start_time, :end_time, :photo)
  end
end
