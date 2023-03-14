require_relative "./person"
require_relative "./capitalize_decorator"
require_relative "./trimmer_decorator"

person = Person.new(22, 'maximilianus')
capitalizedPerson = CapitalizeDecorator.new(person)
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts  person.correct_name
puts  capitalizedPerson.correct_name
puts  capitalizedTrimmedPerson.correct_name