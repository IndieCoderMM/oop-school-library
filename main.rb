require_relative './person'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './classroom'
require_relative './student'
require_relative './book'
require_relative './rental'

# Checking decorators
person = Person.new(22, 'maximilianus')
capitalized_person = CapitalizeDecorator.new(person)
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts person.correct_name
puts capitalized_person.correct_name
puts capitalized_trimmed_person.correct_name

# Checking associations

math_class = Classroom.new('Math')
peter = Student.new(22, 'Peter', classroom: math_class)
puts "#{math_class.label} students: #{math_class.students.map(&:name)}"

history_class = Classroom.new('History')
history_class.add_student(peter)
puts "#{peter.name} is studying: #{peter.classroom.label}"

book1 = Book.new('Habits', 'James')
person.add_rental(Rental.new('3-3-23', book1, person))
puts "#{book1.title}'s rentals: #{book1.rentals.map(&:person).map(&:name)}"

book2 = Book.new('Work', 'Cal')
book2.add_rental(Rental.new('12-3-23', book2, peter))
puts "#{peter.name}'s rentals: #{peter.rentals.map(&:book).map(&:title)}"
