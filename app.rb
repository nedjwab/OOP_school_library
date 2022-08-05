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

  def list_people
    key = 0
    puts
    puts 'People'
    puts 'No people available! Choose (3) to create a person ' if @people.empty?
    @people.each do |person|
      print "#{key}- [#{person.class.name}] ID: #{person.id} Name: #{person.name} Age: #{person.age} "
      print "Parent Permission: #{person.parent_permission}" if person.is_a?(Student)
      print "Specialisation: #{person.specialization}" if person.is_a?(Teacher)
      puts
      key += 1
    end
  end

  def create_person
    entry = nil
    print 'Choose (1) to Create a Student or (2) for a Teacher: '
    until [1, 2].include?(entry)
      entry = gets.chomp.strip.to_i
      puts 'Choice is not correct : (1) for Student, (2) for Teacher' unless [1, 2].include?(entry)
    end
    case entry
    when 1
      create_student
    when 2
      create_teacher
    else
      p 'Choose between 1 and 2'
    end
  end

  def create_teacher
    age = -1
    print 'Age: '
    while age <= 0
      age = gets.chomp.to_i
      print 'Add correct age of teacher: ' if age <= 0
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Specialization: '
    specialization = gets.chomp.strip.capitalize
    @people.push(Teacher.new(age, specialization, name))
    puts 'Teacher created successfuly!'
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
