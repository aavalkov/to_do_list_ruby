require './lib/task'
require './lib/list'

@list = []
@tasks = []

def main_menu
  loop do
    puts "Press'c' to create a list, 'r' to remove a list, or 's' to show your lists."
    puts "Press 'x' to exit."

    # 'd' to delete a task, 'l' to list all of your tasks 'a' to add a task

    main_choice = gets.chomp
    if main_choice == 'c'
      add_list
    elsif main_choice == 'r'
      delete_lists
    elsif main_choice == 's'
      list_lists
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

# def add_task
#   puts "Enter a description of the new task:"
#   user_description = gets.chomp
#   @task << Task.new(user_description)
#   puts "Task added.\n\n"
# end

def delete_lists
  list_lists
  puts "Enter the number of the list that you'd like to delete"
  deleted_list = gets.chomp.to_i
  @list.delete_at(deleted_list-1)
  list_lists
end

# def delete_task
#   puts list_tasks
#   puts "Enter the number of the item that you'd like to delete"
#   deleted_item = gets.chomp.to_i
#   @task.delete_at(deleted_item-1)
#   puts list_tasks
# end

def list_lists
  puts "Here are all of your lists:"
  @list.each_with_index do |list, index|
    puts "#{index+1}. #{list.description}"
  end
end

# def list_tasks
#   puts "Here are all of your tasks:"
#   # counter = 1
#   @task.each_with_index do |task, index|
#     puts "#{index+1}. #{task.description}"
#     #above code uses string interpolation
#     #also uses "with_index" to act as a counter

#   end
#   puts "\n"
# end

main_menu
