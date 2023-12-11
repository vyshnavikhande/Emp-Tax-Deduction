class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_numbers
      t.datetime :doj
      t.integer :salary

      t.timestamps
    end
  end
end
