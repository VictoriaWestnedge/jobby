class JobsController < ApplicationController

  def index
    @jobs = Job.all

    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @jobs = Job.where(sql_query, query: "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: "jobs/list", locals: { jobs: @jobs }, formats: [:html] }
    end
  end

end
