require './book'
require './person'
require './rental'
require './classroom'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def start_program
    puts 'Welcome to my School Library!'
    until options_list
      input = gets.chomp
      if input == '7'
        puts 'Bye bye :)'
        break
      end

      option input
    end
  end

  def list_all_books
    puts 'No book found, try adding some books first.' if @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_people
    puts 'We didn\'t find any, please add people first and try again.' if @people.empty?
    @people.each { |person| puts "Name: #{person.name}, Age: #{person.age}" }
  end

  def create_person
    puts 'If you want to create a student insert (1) otherwise insert (2) to create a teacher?'
    selection = gets.chomp

    case selection
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def create_student
    print 'Enter student age:'
    age = gets.chomp.to_i
    print 'Enter sudent name: '
    name = gets.chomp
    print 'Does this student has parent permission? (Y/N)'
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      Student.new(age, name, parent_permission: false)
      puts "#{name} Can\'t use our services without parent permission"
    when 'y'
      student = Student.new(age, name, parent_permission: true)
      @people << student
      puts "#{name} was successfully added as a student"
    end
  end

  def create_teacher
    print 'Enter teacher name: '
    name = gets.chomp
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
    puts "#{name} was successfully added as a teacher"
  end

  def create_book
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter author name: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "#{title} by #{author} was created"
  end

  def create_rental
    puts 'Please select a book by entering its ID'
    @books.each_with_index { |book, index| puts "Id: #{index}, Title: #{book.title}, Author: #{book.author}" }
    selected_book = gets.chomp.to_i
    puts 'Slesct a person from the following list by entering his/her number'
    @people.each_with_index { |person, index| puts "Number: #{index}, Name: #{person.name}, Age: #{person.age}" }
    selected_person = gets.chomp.to_i
    puts 'Enter rental starting date using this format (yyyy/mm/dd)'
    date = gets.chomp.to_s
    rental = Rental.new(date, @books[selected_book], @people[selected_person])
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals
    puts 'Enter person ID from the following: '
    @people.each { |person| puts "ID: #{person.id}, Name: #{person.name}" }
    selected_id = gets.chomp.to_i
    puts 'Rented Books:'
    @rentals.each do |rental|
      if rental.person.id == selected_id
        puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end
end
