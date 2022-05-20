require "socket" # Gives accesss to a library to help create/interact with servers

server = TCPServer.new("localhost", 3003) #Create TCP server (layer under HTTP) on localhost
loop do 
  client = server.accept # Waits until someone tries to request something from the server. Once there is a request, it accepts and opens a connection to the client (returns and stored as the client object) 

  request_line = client.gets # Gets the FIRST line of the request (the method, GET or POST)
  puts request_line # Print that line to the console

  client.puts request_line # Send back to the client so it appears in the web browser
  client.close
end
