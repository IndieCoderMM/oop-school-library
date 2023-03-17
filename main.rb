require 'pry'
require_relative './app'


def run_command(app, cmd)
  case cmd
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rental_for_person
  end
end

def main
  app = App.new
  puts '+-----------------------+'
  puts '| 📚 OOP School Library |'
  puts '+-----------------------+'

  loop do
    puts 'Available Commands'
    puts '- [1] List all books', '- [2] List all people', '- [3] Add new person', '- [4] Add new book',
         '- [5] Make a rental', '- [6] List rentals for a person', '- [x] Close the app'

    cmd = app.get_input('Enter your command', options: [1, 2, 3, 4, 5, 6, 'x'])
    break if cmd == 'x'

    puts
    run_command(app, cmd)
    puts
  end
  rating = app.get_input('Please give this app a rating: ⭐', min_length: 0).to_i
  puts rating >= 4 ? "😊 Thanks for giving us #{'⭐' * rating}!" : '😃 Thanks for using our app!'
end

main
