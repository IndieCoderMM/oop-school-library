require_relative "../rental"

describe Rental do 
    before :all do 
        @book = Book.new("Educated", "Tara Westover")
        @person = Person.new(34, "Tom")
        @rental = Rental.new("2023-3-22", @book, @person)
    end
    
    describe "#new" do 
        it "should create a Rental object" do 
            expect(@rental).to be_instance_of Rental
        end
    end

    describe "#book" do 
        it "should have the correct book" do 
            expect(@rental.book).to eql @book 
        end
    end

    describe "#person" do 
        it "should have the correct person" do 
            expect(@rental.person).to eql @person
        end
    end
end