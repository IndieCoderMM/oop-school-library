require_relative './spec_helper.rb'

describe Teacher do 
    before :each do 
        @teacher = Teacher.new(42, "Bob", specialization: "History")
    end

    describe "#new" do 
        it "should create a Teacher object" do 
            expect(@teacher).to be_instance_of Teacher
        end
    end

    describe "#name" do 
        it "should return the correct name" do 
            expect(@teacher.name).to eql "Bob"
        end
    end

    describe "#age" do 
        it "should return the correct age" do 
            expect(@teacher.age).to eql 42
        end
    end

    describe "#specialization" do 
        it "should return the correct specialization" do 
            expect(@teacher.specialization).to eql "History"
        end
    end
end
