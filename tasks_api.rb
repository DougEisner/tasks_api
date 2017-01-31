require 'sinatra'
require_relative 'environment'
require_relative 'task'

get '/api/tasks' do
  tasks = Task.all
  tasks.to_json
end

get '/api/tasks/:id' do |id|
  begin
    task = Task.find(id)
    task.to_json
  rescue ActiveRecord::RecordNotFound
    status 404
  end
end

#POST /api/tasks - create a new task, read request body as JSON for input task data

post '/api/tasks' do
  user_enters_new_task
  #Task.create(description: 'find keys', priority: 3)
end

#   Task.create(description: find keys, priority: priority)
