require_relative './spec_helper'

describe Student do
  before :each do
    classroom = Classroom.new('English')
    @student = Student.new(22, 'John', classroom: classroom)
  end

  describe '#new' do
    it 'should create a Student object' do
      expect(@student).to be_instance_of Student
    end
  end

  describe '#name' do
    it 'should return the correct name' do
      expect(@student.name).to eql 'John'
    end
  end

  describe '#age' do
    it 'should return the correct age' do
      expect(@student.age).to eql 22
    end
  end

  describe '#classroom' do
    it 'should return the correct classroom' do
      expect(@student.classroom.label).to eql 'English'
    end
  end

  describe '#classroom=' do
    it 'should be in different classroom' do
      @student.classroom = Classroom.new('Maths')
      expect(@student.classroom.label).to eql 'Maths'
    end
  end
end
