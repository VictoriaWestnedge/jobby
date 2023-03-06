class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :address
      t.string :city
      t.integer :qty_hour
      t.integer :price_per_hour
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.float :latitude
      t.float :longitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
