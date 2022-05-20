class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname
      t.date :birthday
      t.string :phone
      t.string :email
      t.string :country
      t.string :city
      t.string :address

      t.timestamps
    end
  end
end
