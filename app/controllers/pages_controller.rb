class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    jobs_with_accepted_pending = MyJob.select(:job_id).distinct.where(status: "accepted").pluck(:job_id)
    # @jobs = Job.all
    @jobs =Job.where.not(id: jobs_with_accepted_pending).order(created_at: :desc)
  end
end
