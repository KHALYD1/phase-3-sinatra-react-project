class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get"/" do
   "Helo World"
  end

  post "/tasks" do
   Task.create(
     description: params[:description],

   ).to_json
 end

 get "/tasks" do
   task=Task.all
   task.to_json

 end
end
