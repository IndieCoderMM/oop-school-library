require_relative './spec_helper'

describe CapitalizeDecorator do 
    before :all do 
        person = Person.new(23, "hein thant")
        @capitalize_decor = CapitalizeDecorator.new(person)
    end

    describe "#new" do
        it "should create a CapitalizeDecorator object" do
            expect(@capitalize_decor).to be_instance_of CapitalizeDecorator
        end
    end

    describe "#correct_name" do 
        it "should capitalize the name" do 
            expect(@capitalize_decor.correct_name).to eql "Hein Thant"
        end
    end
end