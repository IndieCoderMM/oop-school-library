require 'pry'
require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './classroom'

class App
  def initialize
    @books = []
    @people = []
    @classrooms = {}
    init_classrooms(%w[maths english history])
  end

  def list_books
    if @books.empty?
      puts '[i] Booklist is empty!'
    else
      puts '# List of All Books'
      list_all(@books)
    end
  end

  def list_people
    if @people.empty?
      puts '[i] No one here!'
    else
      puts '# List of All People'
      list_all(@people)
    end
  end

  def create_person
    puts '# Creating New Person'
    role = get_input("Select person's role ::[S]tudent; [T]eacher::", options: %w[s t S T])
    role = role.downcase == 's' ? 'student' : 'teacher'
    name = get_input('Enter Name')
    age = get_input('Enter age', type: 'num')
    case role
    when 'student'
      create_student(name, age)
    when 'teacher'
      create_teacher(name, age)
    end
  end

  def create_book
    puts '# Creating New Book'
    title = get_input('Enter title')
    author = get_input('Enter author')
    book = Book.new(title, author)
    @books.push(author)
    puts '[$] New book created successfully!', book.to_s
  end

  def create_rental
    if @books.empty?
      puts '[i] Add books to make a rental'
      return
    elsif @people.empty?
      puts '[i] Add people to make a rental'
      return
    end

    puts '# Creating New Rental'
    list_all(@books)
    book_index = get_input('Select a book by number', options: (1..@books.length).to_a) - 1
    list_all(@people)
    people_index = get_input('Select a person by number', options: (1..@people.length).to_a) - 1
    date = get_input('Enter date', type: 'date')
    rental = Rental.new(date, @books[book_index], @people[people_index])
    puts '[$] Rental created successfully!'
    puts "#{rental.date} Book: #{rental.book.title}, Borrower: #{rental.person.name}"
  end

  def list_rental_for_person
    if @people.empty?
      puts '[i] No one here!'
      return
    end

    person_id = get_input("Enter person's ID", type: 'num')
    person = @people.select { |p| p.id == person_id }[0]
    if person.nil?
      puts "[!] Person with ID:#{person_id} not found"
      return
    elsif person.rentals.empty?
      puts "[i] #{person.name} has no rentals"
    end
    puts "# List of Rentals for #{person.name}"
    person.rentals.each do |rental|
      puts "#{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
    end
  end

  def get_input(prompt, options: [], min_length: 1, type: 'str')
    valid = false
    input = nil
    until valid
      print prompt, ' >> '
      input = gets.chomp.strip
      next unless valid?(input, min_length, type)

      unless type == 'date'
        input = input.to_i.zero? ? input : input.to_i
      end
      if !options.empty? && !options.include?(input)
        puts '[!] Invalid Input', "\t::options::#{options}"
        next
      end

      valid = true
    end
    input
  end

  private

  def create_student(name, age)
    classrooms_a = []
    classrooms_s = ''
    @classrooms.each_key { |k| classrooms_a.push(k, k.upcase) }
    @classrooms.each_value do |c|
      str = "[#{c.label[0].upcase}]#{c.label[1..]}; "
      classrooms_s += str
    end
    choice = get_input("Choose classroom ::#{classrooms_s[0...-2]}::", options: classrooms_a)
    classroom = @classrooms[choice.downcase]
    permission = get_input('Has parent permission [Y/n]?', min_length: 0)
    permission = permission.empty? ? 'y' : permission.to_s.downcase
    student = Student.new(age, name, classroom: classroom, parent_permission: permission == 'y')
    @people.push(student)
    puts '[$] New student created successfully!', student.to_s
  end

  def create_teacher(name, age)
    specialization = get_input('Enter specialization')
    teacher = Teacher.new(age, name, specialization: specialization)
    @people.push(teacher)
    puts '[$] New teacher created successfully!', teacher.to_s
  end

  def init_classrooms(classes)
    classes.each do |classname|
      @classrooms[classname[0]] = Classroom.new(classname.capitalize)
    end
  end

  def valid?(input, min_length, type)
    if input.length < min_length
      puts '[!] Please enter a value'
      return false
    end
    if type == 'num' && input.to_i <= 0
      puts '[!] Please enter a valid number'
      return false
    end
    if type == 'date'
      date_format = /\d{4}-\d{1,2}-\d{1,2}/
      unless input.match(date_format)
        puts '[!] Date must be in %Y-%m-%d format'
        return false
      end
    end
    true
  end

  def list_all(items)
    items.each_with_index do |item, index|
      puts "#{index + 1}. #{item}"
    end
  end
end
