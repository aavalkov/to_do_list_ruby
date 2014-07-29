require './lib/task'

@list = []

def main_menu
  loop do
    puts "Press 'a' to add a task, 'd' to delete a task, or 'l' to list all of your tasks."
    puts "Press 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'a'
      add_task
    elsif main_choice == 'd'
      delete_task
    elsif main_choice == 'l'
      list_tasks
    elsif main_choice == 'x'
      puts "Good-bye!"
      exit
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def delete_task
  puts list_tasks
  puts "Enter the number of the item that you'd like to delete"
  deleted_item = gets.chomp.to_i
  @list.delete_at(deleted_item-1)
  puts list_tasks
end

def add_task
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  @list << Task.new(user_description)
  puts "Task added.\n\n"
end

def list_tasks
  puts "Here are all of your tasks:"
  # counter = 1
  @list.each_with_index do |task, index|
    puts "#{index+1}. #{task.description}"
    # puts counter.to_s + " " + task.description
    # counter+=1
  end
  puts "\n"
end

main_menu
