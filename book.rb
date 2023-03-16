class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def to_s 
    "<#{self.class}> #{title_case(@title)} by #{title_case(@author)}"
  end

  private 

  def title_case(text)
    text.split.map(&:capitalize).join(' ')
  end
end
