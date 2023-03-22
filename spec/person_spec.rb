require_relative './spec_helper.rb'

describe Person do 
    before:each do
        @person = Person.new 20, "Name"
    end

    describe "#new" do
        it "takes two parameters and returns a Person object" do
            expect(@person).to be_an_instance_of Person
        end
    end

    describe "#name" do
        it "returns the correct name" do
            expect(@person.name).to eql "Name"
        end
    end

    describe "#age" do
        it "returns the correct age" do
            expect(@person.age).to eql 20
        end
    end

end