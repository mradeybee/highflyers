class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.references :teacher, foreign_key: true
      t.string :code

      t.timestamps
    end
  end
end
