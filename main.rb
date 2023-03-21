require_relative './app'
require_relative './run_command'
require_relative './input'

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
    cmd = Input.get('Enter your command', options: [1, 2, 3, 4, 5, 6, 'x', 'X'])
    break if cmd.to_s.downcase == 'x'

    puts
    RunCommand.run(app, cmd)
    puts
  end
  app.close
end

main
