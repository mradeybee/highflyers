[![Build Status](https://travis-ci.org/mradeybee/highflyers.svg?branch=master)](https://travis-ci.org/mradeybee/highflyers)
[![Maintainability](https://api.codeclimate.com/v1/badges/ccac9d2adc936cd1ee16/maintainability)](https://codeclimate.com/github/mradeybee/highflyers/maintainability)

# Highflyers

## End Points Functionalities
|End Point| Body Payload | Description  |
|:---------------------:|  :----:| :----:|
| **GET /high_flyers/:id** | | Get highflyer in id'th posission
| **POST /high_flyers/:id/rate/:teacher_id**| rating | Registers a highflyer's rating of a teacher. This rates the user 2X the normal rating.
| **GET /students** | | Lists all Students
| **GET /teachers** | | Lists all Teachers
| **GET /courses** | | Lists all Courses
| **POST /teachers** | name, email | Creates a Teacher Record
| **POST /students** | name, email | Creates a Student Record
| **POST /courses** | name, code, teacher_id | Creates a Course Record
| **POST /courses/:id/register/:student_id** |  | Student register for a course
| **POST /teachers/:id/score_student/:student_id** | score, course_id | Teacher submits score of a course for a student 
| **POST /students/:id/rate_teacher/:teacher_id** | rating | Student rates a teacher
