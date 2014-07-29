require './lib/task'
require './lib/list'

@list = []

def main_menu
  loop do
    puts "Press'c' to create a list, 'r' to remove a list, or 's' to show your lists."
    puts "Press 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'c'
      add_list
    elsif main_choice == 'r'
      delete_lists
    elsif main_choice == 's'
      list_lists
      puts "Press 't' to add a task,'v' to view tasks, or press any other button to go back to the main menu"
        task_choice = gets.chomp
          if task_choice == "t"
            add_task
            next
          elsif task_choice == "v"
            puts "Which list of tasks would you like to view?"
            list_view = gets.chomp.to_i
            list_tasks(list_view)
            puts "Press 'x' to exit or 'd' to delete a task"
            task_delete = gets.chomp
              if task_delete == 'x'
                next
              elsif task_delete == 'd'
                delete_task(list_view)
                next
              else
                next
              end
          end
    elsif main_choice == 'x'
      puts "Good-bye!"
      exit
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def add_list
  puts "Enter your list's name"
  list_description = gets.chomp
  @list << List.new(list_description)
  puts "List added. \n\n"
end

def delete_lists
  list_lists
  puts "Enter the number of the list that you'd like to delete"
  deleted_list = gets.chomp.to_i
  @list.delete_at(deleted_list-1)
  list_lists
end

def list_lists
  puts "Here are all of your lists:"
  @list.each_with_index do |list, index|
    puts "#{index+1}. #{list.description}"
  end
end

def add_task
  list_lists
  puts "Which list would you like to put your task inside?"
  list_choice = gets.chomp.to_i
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  @list[list_choice-1].add_task(Task.new(user_description))
  list_tasks(list_choice)
  puts "Task added.\n\n"
end

def delete_task(x)
  puts "Enter the number of the item that you'd like to delete"
  deleted_item = gets.chomp.to_i
  @list[x-1].tasks.delete_at(deleted_item-1)
  list_tasks(x)
end

def list_tasks(x)
  puts "Here are all of your tasks for this list:"
  @list[x-1].tasks.each_with_index do |task, index|
    puts "#{index + 1}. #{task.description}"
  end
    #above code uses string interpolation
    #also uses "with_index" to act as a counter
  puts "\n"
end

main_menu
