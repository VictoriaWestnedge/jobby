class JobsController < ApplicationController

  def index
    @jobs = Job.all

    if params[:query].present?
      @jobs = Job.search_by_name_and_description_and_city(params[:query])
    end

    @markers = @jobs.geocoded.map do |job|
      {
        lat: job.latitude,
        lng: job.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { job: job }, formats: [:html])
      }
    end

    respond_to do |format|
      format.html
      format.text { render partial: "jobs/list", locals: { jobs: @jobs }, formats: [:html] }
    end

  end
end
