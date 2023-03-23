require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', classroom:, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_s
    "<#{self.class}> #{name} [ID: ##{@id} | Age: #{@age} | Class: #{@classroom.label}]"
  end

  def to_h
    {
      id: @id,
      role: self.class,
      age: @age,
      name: @name,
      classroom: @classroom.label,
      parent_permission: @parent_permission
    }
  end
end
