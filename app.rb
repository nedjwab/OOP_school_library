# rubocop:disable Metrics/CyclomaticComplexity
require './book'
require './teacher'
require './student'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def options
    puts '1 - List all book'
    puts '2 - List all People'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def check(option)
    case option
    when 1
      fetch_books
    when 2
      fetch_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      fetch_rentals
    when 7
      nil
    else
      puts 'Wrong value specified'
      options
    end
  end

  def menu
    puts
    p 'School Library App!'
    puts
    option = nil
    while option != 7
      puts 'Please choose an option by entrering a number: '
      options
      print '[Input number]: '
      option = gets.chomp.strip.to_i
      check(option)
      puts
    end
    puts 'GOOD BYE'
  end

  def list_books
    key = 0
    puts
    puts 'Books'
    puts 'No book available! Choose (4) to  create one' if @books.empty?
    @books.each do |book|
      puts "#{key}- Title: #{book.title} Author: #{book.author}"
      key += 1
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
