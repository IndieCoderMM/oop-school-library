require_relative "./book"
require_relative "./student"
require_relative "./teacher"
require_relative "./rental"
require_relative "./classroom"

class App
    def initialize
        @books = []
        @people = []
        @classrooms = {}
        init_classrooms
    end

    def run
      puts "📚 OOP School Library"
      puts "----------------------"
      loop do 
          print_commands
          cmd = get_input("Enter your command", options: [1, 2, 3, 4, 5, 'x'])
          puts
          break if cmd == "x"
          case cmd
          when 1
            if @books.empty?
              puts "# Booklist is empty!"
            else
              puts "# List of All Books"
              list_all(@books)
            end
          when 2
            if @people.empty?
              puts "# No one here!"
            else
              puts "# List of All People"
              list_all(@people)
            end
          when 3
            create_person
          when 4
            create_book
          end
          puts 
      end
      puts "Thanks for using our app 👋"
    end

    private 

    def create_person
      puts "# Creating New Person"
      role = get_input("Select person's role ::[1]Student; [2]Teacher::", options: [1, 2])
      role = role == 1 ? "student" : "teacher" 
      name = get_input("Enter Name") 
      age = get_input("Enter age", num_only: true)
      case role 
      when "student"
        choice = get_input("Choose classroom ::[M]ath; [C]omputer; [H]istory::", options: ['m', 'c', 'h'])
        case choice
        when "m"
          classroom = @classrooms[:math]
        when "c"
          classroom = @classrooms[:computer]
        when "h"
          classroom = @classrooms[:history]
        end
        permission = get_input("Has parent permission [y/n]?", min_length: 0)
        student = Student.new(age, name, classroom: classroom, parent_permission: permission == 'y')
        @people.push(student)
        puts "[OK] New student created successfully!", student.to_s
      when "teacher"
        specialization = get_input("Enter specialization")
        teacher = Teacher.new(age, name, specialization: specialization)
        @people.push(teacher)
        puts "[OK] New teacher created successfully!", teacher.to_s 
      end
    end

    def create_book
      puts "# Creating new book"
      title = get_input("Enter title")
      author = get_input("Enter author")
      book = Book.new(title, author)
      @books.push(book)
      puts "[OK] New book created successfully!", book.to_s
    end


    def init_classrooms
      math = Classroom.new("Math")
      computer = Classroom.new("Computer")
      history = Classroom.new("History")
      @classrooms = {math: math, computer: computer, history: history}
    end

    def get_input(prompt, options: [], min_length: 1, num_only: false)
      valid = false 
      input = nil
      until valid do 
        print prompt, " >> "
        input = gets.chomp.strip
        if input.length < min_length
          puts "[!] Please enter a value"
          next
        end
        if num_only && input.to_i <= 0
          puts "[!] Please enter a valid number"
          next
        end
        input = input.to_i != 0 ? input.to_i : input
        unless options.empty?
          unless options.include?(input)
            puts "[!] Invalid Input"
            next
          end
        end
        
        valid = true 
      end
      input 
    end

    def print_commands
      puts "Available Commands"
      puts "- [1] List all books"
      puts "- [2] List all people"
      puts "- [3] Add new person"
      puts "- [4] Add new book"
      puts "- [5] Make a rental"
      puts "- [6] List rentals for person's <id>"
      puts "- [x] Close the app"
    end     

    def list_all(items)
      items.each do |item|
        puts item.to_s 
      end
    end
end