class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating_star, default: 0
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
