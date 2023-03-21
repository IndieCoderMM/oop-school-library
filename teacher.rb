require_relative './person'

class Teacher < Person
  def initialize(age, name = 'Unknown', specialization:, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_s
    "<#{self.class}> #{@name} [ID: ##{@id} | Age: #{@age} | Subject: #{@specialization}]"
  end

  def to_h
    {
      id: @id,
      age: @age,
      name: @name,
      specialization: @specialization,
      parent_permission: @parent_permission
    }
  end
end
