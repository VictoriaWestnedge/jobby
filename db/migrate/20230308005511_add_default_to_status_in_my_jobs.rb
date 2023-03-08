class AddDefaultToStatusInMyJobs < ActiveRecord::Migration[7.0]
  def change
    change_column_default :my_jobs, :status, 1
  end
end
