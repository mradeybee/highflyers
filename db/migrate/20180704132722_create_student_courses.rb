class CreateStudentCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :student_courses do |t|
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
      t.references :teacher, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
