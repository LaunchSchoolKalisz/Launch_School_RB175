require "socket" 

server = TCPServer.new("localhost", 3003) 

def parse_request(request_line)
  http_method, path_and_params, http = request_line.split(" ")
  path, params = path_and_params.split("?")
  params = params.split("&")
  
  params = params.each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end

  [http_method, path, params]
end

loop do 
  client = server.accept # Waits until someone tries to request something from the server. Once there is a request, it accepts and opens a connection to the client (returns and stored as the client object) 

  request_line = client.gets 
  next if !request_line || request_line =~ /favicon/ 
  puts request_line 

  http_method, path, params = parse_request(request_line)

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts

  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>" 
  client.puts request_line
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"


  client.puts "</body>"
  client.puts "</html>"

  client.close
end