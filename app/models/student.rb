class Student < User
  default_scope { where(role: roles['student']) }

end