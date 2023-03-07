class JobsController < ApplicationController

  def index
    @jobs = Job.all

    if params[:query].present?
      @jobs = @jobs.where("name ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "jobs/list", locals: { jobs: @jobs }, formats: [:html] }
    end
  end

end
