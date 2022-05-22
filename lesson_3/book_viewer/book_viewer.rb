require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  @table_of_contents = File.read("data/toc.txt")
  @contents = File.readlines("data/toc.txt")
  
  erb :home
end

get "/chapters/:number" do
  @number = params[:number]
  @title = "Chapter #{@number}"
  @contents = File.readlines("data/toc.txt")
  @chapter = File.read("data/chp#{@number}.txt")

  erb :chapter
end

get "/show/:name" do
  params[:name]
end