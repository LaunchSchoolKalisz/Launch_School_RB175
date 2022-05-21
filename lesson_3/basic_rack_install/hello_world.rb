# hello_world.rb

class HelloWorld
  def call(env)
    ['200', {'Content-Type' => 'text/plain'}, ['Hello World!']]
  end
end

=begin
We know it is a Rack application because it has the method call(env), and that method returns a 3 element array containing the exact information needed for a proper Rack application: a status code (string), headers (hash), and a response body (responds to each).
=end