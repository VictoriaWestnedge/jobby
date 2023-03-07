class ChangeStatusDataTypeInMyJobs < ActiveRecord::Migration[7.0]
  def change
    change_column :my_jobs, :status, :integer, using: 'status::integer'
  end
end
