require_relative './app'
require_relative './run_command'

def display_options
  puts 'Available Commands'
  puts '- [1] List all books', '- [2] List all people', '- [3] Add new person', '- [4] Add new book',
       '- [5] Make a rental', '- [6] List rentals for a person', '- [x] Close the app'
end

def main
  app = App.new

  puts '+-----------------------+'
  puts '| 📚 OOP School Library |'
  puts '+-----------------------+'

  loop do
    display_options
    cmd = app.get_input('Enter your command', options: [1, 2, 3, 4, 5, 6, 'x'])
    break if cmd == 'x'

    puts
    run_command = RunCommand.new(app, cmd)
    run_command.run_cmd(app, cmd)
    puts
  end
  rating = app.get_input('Please give this app a rating: ⭐', min_length: 0).to_i
  puts rating >= 4 ? "😊 Thanks for giving us #{'⭐' * rating}!" : '😃 Thanks for using our app!'
end

main
