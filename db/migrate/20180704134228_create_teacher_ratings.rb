class CreateTeacherRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_ratings do |t|
      t.references :student, foreign_key: true
      t.references :teacher, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
