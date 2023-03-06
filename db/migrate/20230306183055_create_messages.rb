class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :chatroom, null: false, foreign_key: true
      t.references :employer, null: false
      t.references :employee, null: false

      t.timestamps
    end
    add_foreign_key :messages, :users, column: :employer_id
    add_foreign_key :messages, :users, column: :employee_id
  end
end
