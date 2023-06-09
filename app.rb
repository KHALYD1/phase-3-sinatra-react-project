require 'sinatra'
require 'sinatra/activerecord'
require 'json'

# Set the desired port
set :port, 9292

# # Models
# require_relative './models/task'

# Get all tasks
get '/tasks' do
  tasks = Task.all
  tasks.to_json
end

# Create a new task
post '/tasks' do
  task_params = JSON.parse(request.body.read)
  task = Task.create(task_params)
  task.to_json
end

# Update a task
put '/tasks/:id' do |id|
  task = Task.find(id)
  if task
    task_params = JSON.parse(request.body.read)
    task.update(task_params)
    task.to_json
  else
    status 404
    body "Task not found"
  end
end

