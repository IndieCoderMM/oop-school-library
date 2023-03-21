require 'json'

class Storage
    BOOKS_FILE = './data/books.json'
    PEOPLE_FILE = './data/people.json'
    RENTALS_FILE = './data/rentals.json'
    
    def initialize(app)
        @app = app 
    end

    def load_data
        load_books(BOOKS_FILE, @app.books)
        load_people(PEOPLE_FILE, @app.people, @app.classrooms)
        load_rentals(RENTALS_FILE, @app.rentals, @app.books, @app.people)
    end

    def save_data
        File.write(BOOKS_FILE, JSON.generate(@app.books.map(&:to_h)))
        File.write(PEOPLE_FILE, JSON.generate(@app.people.map(&:to_h)))
        File.write(RENTALS_FILE, JSON.generate(@app.rentals.map(&:to_h)))
    end

    private

    def read_data(filename)
        file = File.open(filename)
        file_data = file.read
        file.close
        if file_data.length != 0
            return JSON.parse(file_data) 
        else 
            return []
        end
    end

    def load_books(filename, books)
        file_data = read_data(filename)
        file_data.each do |data|
            books << Book.new(data["title"], data["author"])
        end
    end

    def load_people(filename, people, classrooms)
        file_data = read_data(filename)
        file_data.each do |data|
            role = data["role"]
            age = data["age"]
            name = data["name"]
            if role == "Student"
            parent_permission = data["parent_permission"]
            classroom = classrooms[data["classroom"][0].downcase]
            people << Student.new(age, name, classroom: classroom, parent_permission: parent_permission)
            else 
            specialization = data["specialization"]
            people << Teacher.new(age, name, specialization: specialization)
            end
        end
    end

    def load_rentals(filename, rentals, books, people)
        file_data = read_data(filename)
        file_data.each do |data|
            date = data["date"]
            book = books.select {|book| book.title == data["book"]["title"]}[0] 
            person = people.select {|person| person.name == data["person"]["name"]}[0] 
            next if !book || !person 
            rentals << Rental.new(date, book, person)
        end
    end
end