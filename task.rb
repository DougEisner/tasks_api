require 'active_record'
require_relative 'environment'

class Task < ActiveRecord::Base
end

# Creates new task
def user_enters_new_task
  puts "Enter task description: "
  description = gets.chomp
  puts "Enter priority: "
  priority = gets.chomp
  Task.create(description: description, priority: priority)
end

def print_all_tasks
  print "Here are all tasks: "
  Task.all.each do |task|
    puts task.description
  end
end

def search_for_task
  task = get_user_task_to_find

  found_tasks = Task.where('description LIKE ?', ['%' + task + '%']) # "%#{task}%"

  found_tasks.each do |task|
    puts task.description
  end
end

def get_user_task_to_find
  puts "What task would you like to find: "
  gets.chomp
end

def number_of_tasks
  puts "You have #{Task.count} tasks to do!"
end

def main
  print_all_tasks

  search_for_task
  number_of_tasks
end

main if __FILE__ == $PROGRAM_NAME
