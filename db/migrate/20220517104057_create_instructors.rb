class CreateInstructors < ActiveRecord::Migration[7.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :surname
      t.string :initials
      t.string :license

      t.timestamps
    end
  end
end
