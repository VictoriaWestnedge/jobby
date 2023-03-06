class CreateMyJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :my_jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
