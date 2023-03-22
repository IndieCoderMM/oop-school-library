require_relative './spec_helper'

describe Decorator do 
    before :all do 
        @person = Person.new(30, "Jones")
        @decorator = Decorator.new(@person)
    end

    describe "#new" do 
        it "should create a Decorator object" do 
            expect(@decorator).to be_instance_of Decorator
        end
    end

    describe "#correct_name" do 
        it "should return the correct name" do 
            expect(@decorator.correct_name).to eql @person.correct_name
        end
    end
end