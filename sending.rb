require 'socket'
require 'rubygems'
require 'sendfile'

rd, wr = IO.pipe
if fork 
else
  s = TCPSocket.new 'localhost', 5000
  File.open 'TODO.txt' { |f| s.sendfile f }
  s.close
end
