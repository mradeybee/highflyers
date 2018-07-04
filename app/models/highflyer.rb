class Highflyer < Student
  # default_scope { joins(:course_scores).where('course_scores.score >= ?', 80) }

  def self.at_possision(possision)
    # includes(:course_scores).order("course_scores.score desc").limit(1).offset(possision)
  end
end