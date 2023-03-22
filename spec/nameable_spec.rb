require_relative './spec_helper'

describe Nameable do
  before :all do
    @nameable = Nameable.new
  end

  describe '#new' do
    it 'should create a Nameable object' do
      expect(@nameable).to be_instance_of Nameable
    end
  end

  describe '#correct_name' do
    it 'should raise a not-implemented-error' do
      expect { @nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
