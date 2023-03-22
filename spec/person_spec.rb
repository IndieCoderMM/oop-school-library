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

    # describe "should return correct name" do
    #     it "returns the correct name" do
    #         c_n = @person.correct_name
    #         expect(c_n).to eql("Name")
    #     end
    # end

end