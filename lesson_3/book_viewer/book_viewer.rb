require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  @table_of_contents = File.read("data/toc.txt")
  @contents = File.readlines("data/toc.txt")
  
  erb :home
end

get "/chapters/1" do
  @text = File.read("data/chp1.txt")

end