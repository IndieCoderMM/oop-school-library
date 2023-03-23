require_relative './spec_helper'

describe Classroom do
  before :all do
    @classroom = Classroom.new('Maths')
    @student = Student.new(20, 'Jim', classroom: Classroom.new('History'))
  end

  describe '#new' do
    it 'should create a Classroom object' do
      expect(@classroom).to be_instance_of Classroom
    end
  end

  describe '#add_student' do
    context 'before adding a student' do
      it 'should have no student' do
        expect(@classroom.students.length).to eql 0
      end
    end
    context 'after adding a student' do
      it 'should have exactly one student' do
        @classroom.add_student(@student)
        expect(@classroom.students.length).to eql 1
      end
      it 'should return the correct student' do
        expect(@classroom.students[0]).to eql @student
      end
    end
  end
end
