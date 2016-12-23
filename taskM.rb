require 'csv'

class Task
  attr_accessor :task, :completed

  def initialize(task, completed=false)
    @task = task
    @completed = completed
  end
end

class ObjetsStrings
  attr_accessor :string

  def initialize(input)
    @input = input
  end
end

class List

  def csv_creator(input)
    CSV.open("list.csv", "a") do |csv| 
      csv << [input.task, input.completed]
    end 
  end

  def csv_reader
    @array_tasks = []
    csv = CSV.read("list.csv")
    csv.each do |row|
      @array_tasks << Task.new(row[0], row[1])
    end
    @array_tasks
  end

  def csv_delete(task)
    file_1 = CSV.read("list.csv")
    pos = task.to_i
    if pos == 0
      file_1.delete_at(pos)
    else
      file_1.delete_at(pos-1)
    end
    CSV.open("list.csv", "wb") do |t|
      file_1.each {|t2| t << t2}
    end
    file_1
  end

  def csv_complete(input)
    csv_reader

    pos = input[1].to_i
    @array_tasks.each_with_index do |task, index|
      if index + 1 == pos
        task.completed = true
      end
    end

    CSV.open("list.csv", "wb") do |t|
      @array_tasks.each do |t2|
        t << [t2.task, t2.completed]
       end
      end
      csv_reader
    end

  end