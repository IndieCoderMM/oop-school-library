require_relative './spec_helper'

describe Person do
  before :each do
    @person = Person.new(20, 'Tati')
  end

  describe '#new' do
    it 'takes three parameters and returns a Person object' do
      expect(@person).to be_an_instance_of Person
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(@person.name).to eql('Tati')
    end
  end

  describe '#age' do
    it 'returns the correct age' do
      expect(@person.age).to eql(20)
    end
  end

  describe '#can_use_services?' do
    context 'if over age' do
      it 'should return true even if no parent permission' do
        @person.parent_permission = false
        expect(@person.can_use_services?).to be true
      end
    end

    context 'if under age' do
      it 'should return false with no parent permission' do
        @person.age = 11
        @person.parent_permission = false
        expect(@person.can_use_services?).to be false
      end

      it 'should return true with parent permission' do
        @person.age = 11
        expect(@person.can_use_services?).to be true
      end
    end
  end

  describe '#add_rental' do
    context 'before adding rental' do
      it 'should have no rental' do
        expect(@person.rentals.length).to eql 0
      end
    end

    context 'after adding a rental' do
      it 'should have exactly one rental' do
        rental = Rental.new('2023-2-3', Book.new('Title', 'Author'), @person)
        @person.add_rental(rental)
        expect(@person.rentals.length).to eql 1
      end

      it 'should contain one Rental object' do
        rental = Rental.new('2023-2-3', Book.new('Title', 'Author'), @person)
        @person.add_rental(rental)
        expect(@person.rentals[0]).to be_an_instance_of Rental
      end
    end
  end
end
