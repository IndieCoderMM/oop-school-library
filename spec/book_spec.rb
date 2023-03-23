require_relative './spec_helper'

describe Book do
  before :each do
    @book = Book.new 'Title', 'Author'
  end
  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end
  describe '#title' do
    it 'returns the correct title' do
      expect(@book.title).to eql 'Title'
    end
  end
  describe '#author' do
    it 'returns the correct author' do
      expect(@book.author).to eql 'Author'
    end
  end
  describe '#add_rental' do
    context 'before adding rental' do
      it 'should have no rental initially' do
        expect(@book.rentals.length).to eql 0
      end
    end

    context 'after adding a rental' do
      it 'should have exactly one rental' do
        rental = Rental.new('2023-3-22', @book, Person.new(22, 'James'))
        @book.add_rental(rental)
        expect(@book.rentals.length).to eql 1
      end
      it 'should contain one Rental object' do
        rental = Rental.new('2023-3-22', @book, Person.new(22, 'James'))
        @book.add_rental(rental)
        expect(@book.rentals[0]).to be_instance_of Rental
      end
    end
  end
end
