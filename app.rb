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

    def init_classrooms
      math = Classroom.new("Math")
      computer = Classroom.new("Computer")
      history = Classroom.new("History")
      @classrooms = {math: math, computer: computer, history: history}
    end

    def create_person
      puts "Create new person"
      puts "[1] Student; [2] Teacher"
      role = get_input("Select person's role", options: [1, 2])
      role = role == 1 ? "student" : "teacher" 
      name = get_input("Enter Name") 
      age = get_input("Enter age")
      case role 
      when "student"
        puts "[M]ath; [C]omputer; [H]istory"
        choice = get_input("Choose classroom", options: ['m', 'c', 'h'])
        case choice
        when "m"
          classroom = @classrooms[:math]
        when "c"
          classroom = @classrooms[:computer]
        when "h"
          classroom = @classrooms[:history]
        end
        permission = get_input("Parent permission [y/n]", min_length: 0)
        student = Student.new(age, name, classroom: classroom, parent_permission: permission == 'y')
        puts "New student created successfully!"
        puts student.to_s
      when "teacher"
        specialization = get_input("Enter specialization")
        teacher = Teacher.new(age, name, specialization: specialization)
        puts "New teacher created successfully!"
        puts teacher.to_s 
      end
    end

    def run
        puts "📚 OOP School Library"
        loop do 
            puts "Available Commands"
            puts "[1] List all books"
            puts "[2] List all people"
            puts "[3] Add new person"
            puts "[4] Add new book"
            puts "[4] Make a rental"
            puts "[5] List rentals for person <id>"
            puts "[x] Close the app"
            cmd = get_input("Enter your command", options: [1, 2, 3, 4, 5, 'x'])
            puts "Your command is: #{cmd}"
            break if cmd == "x"
            if cmd.to_i == 3
              create_person
            end
        end
        puts "Thanks for using our app 👋"
    end

    private 
    def get_input(prompt, options: [], min_length: 1)
      valid = false 
      input = nil
      until valid do 
        print prompt, " >> "
        input = gets.chomp 
        if input.length < min_length
          puts "[!] Please enter a value"
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



            
end