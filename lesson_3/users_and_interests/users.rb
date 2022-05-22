require "yaml"

require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @users = YAML.load_file("users.yaml")
end

get "/" do
end