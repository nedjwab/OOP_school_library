require './rental'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author,:rentals

  def add_rental(date, person)
    Rental.new(date, book, person)
  end
end
