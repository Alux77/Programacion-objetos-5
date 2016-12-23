require_relative "taskM.rb"
require_relative "taskV.rb"

class Controller

  def initialize(input)
    @input = input
    @view  = View.new
    @list = List.new
    menu(@input) 
  end

  def menu(input)
    task = input[1..-1].join(' ')
    case input[0]
      when "add" then to_do_list(task)
      when "index" then index
      when "delete" then delete
      when "complete" then complete(input)
    end
  end

  def to_do_list(task)
    new_task = Task.new(task)
    @list.csv_creator(new_task)
    @view.add_task(task)
  end

  def index
    task_list = @list.csv_reader
    @view.show_task(task_list)
  end

  def delete
    ok_task = ARGV[1]
    task_list = @list.csv_delete(ok_task)
    @view.deleted_task(task_list)
  end

  def complete(input)
    task_list = @list.csv_complete(input)
    @view.show_task_2(task_list)
  end

end

input = ARGV
imprime = Controller.new(input)