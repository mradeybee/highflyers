class Teacher < User
  default_scope { where(role: roles['teacher']) }

end