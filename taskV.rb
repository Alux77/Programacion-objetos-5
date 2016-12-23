class View

  def add_task(task)
    p "¡¡PERFECT!! One more task: #{task}"
  end

  def show_task(task_list)
    task_list.each_with_index do |task, index|
     if task.completed == "true"
       mark = "X" 
     else
       mark = " "
     end
     puts "[#{mark}] #{index + 1}: #{task.task}" 
   end 
 end

  def deleted_task(task_list)
    p "¡¡YOU´RE FUCKED!! bye, bye to task ##{ARGV[1]}....."
  end

 def show_task_2(task_list)
    task_list.each_with_index do |task, index|
     if task.completed == "true"
       mark = "x" 
     else
       mark = " "
     end
     puts "[#{mark}] #{index + 1}: #{task.task}" 
   end 
   puts
    p "¡¡AT LAST YOU FINISHED SOMETHING!!"
 end

end