require_relative './spec_helper'

describe TrimmerDecorator do
  before :all do
    person = Person.new(23, 'trimmerdecorator')
    @trimmer_decorator = TrimmerDecorator.new(person)
  end

  describe '#new' do
    it 'Should create a new TrimmerDecorator object' do
      expect(@trimmer_decorator).to be_instance_of TrimmerDecorator
    end
  end
  describe '#correct_name' do
    it 'Should trim the name' do
      expect(@trimmer_decorator.correct_name).to eql 'trimmerdec'
    end
  end
end
