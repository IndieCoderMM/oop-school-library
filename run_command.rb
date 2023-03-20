class RunCommand
  def initialize(app, cmd)
    @app = app
    @cmd = cmd
  end

  def run_cmd(app, cmd)
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
end
