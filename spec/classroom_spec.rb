require_relative './spec_helper'

describe Classroom do 
    before :all do 
        @classroom = Classroom.new("Maths")
        @student = Student.new(20, "Jim", classroom: @classroom)
    end

    describe "#new" do 
        it "should create a Classroom object" do 
            expect(@classroom).to be_instance_of Classroom
        end
    end

    context "Checking students in the classroom" do 
        it "should have exactly one student" do 
            expect(@classroom.students.length).to eql 1
        end
        it "should return the correct student" do 
            expect(@classroom.students[0]).to eql @student 
        end
    end
end