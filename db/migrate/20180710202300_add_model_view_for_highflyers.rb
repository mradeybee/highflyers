class AddModelViewForHighflyers < ActiveRecord::Migration[5.1]
  def up
    connection.execute %(CREATE OR REPLACE VIEW high_flyer AS
      SELECT  "students".*
      FROM "students"
        INNER JOIN "student_courses"
        ON "student_courses"."student_id" = "students"."id"
        INNER JOIN "student_courses" "student_courses_students_join"
        ON "student_courses_students_join"."student_id" = "students"."id"
        INNER JOIN "teachers"
        ON "teachers"."id" = "student_courses_students_join"."teacher_id"
        INNER JOIN "teacher_ratings"
        ON "teacher_ratings"."teacher_id" = "teachers"."id"
      WHERE (student_courses.score >= 80)
      GROUP BY students.id, student_courses.id
      HAVING (AVG(teacher_ratings.rating) >= 1)
      ORDER BY student_courses.score DESC
      LIMIT 1
    )
  end

  def down
    connection.execute 'DROP VIEW IF EXISTS high_flyer;'
  end
end
