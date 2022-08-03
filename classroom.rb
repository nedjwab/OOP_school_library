class Classroom
  def initialize(label)
    @label = label
    @students = []
  end

  attr_accessor :label
  attr_reader :students

  def add_students(student)
    @students.push(student)
    student.owner = self
  end
end
