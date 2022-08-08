require './rental'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author, :rentals

  def add_rental(_date, _person)
    @rental.push(rental)
    rental.book = self
  end
end
