class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.add_rental(self) unless book.rentals.include?(self)
    person.add_rental(self) unless book.rentals.include?(self)
  end

  def to_h
    {
      date: @date,
      book: @book.to_h,
      person: @person.to_h
    }
  end
end
