class JobsController < ApplicationController

  def index
    @jobs = Job.all

    if params[:query].present?
      @jobs = Job.search_by_name_and_description_and_city(params[:query])
    end

    respond_to do |format|
      format.html
      format.text { render partial: "jobs/list", locals: { jobs: @jobs }, formats: [:html] }
    end
  end

end
