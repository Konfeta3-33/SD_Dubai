class CreateJumps < ActiveRecord::Migration[7.0]
  def change
    create_table :jumps do |t|
      t.string :type
      t.integer :status, null: false, default: 0
      t.belongs_to :instructor, foreign_key: true
      t.belongs_to :student, foreign_key: true
      t.jsonb :questionnaire
      t.string :improvement_points, array: true
      t.integer :jump_no
      t.date :date
      t.string :place
      t.string :equipment
      t.string :aircraft
      t.integer :altitude_ft
      t.integer :delay
      t.integer :total_freefall

      t.timestamps
    end
  end
end
