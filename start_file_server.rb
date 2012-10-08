# Parent Process
pid = fork do
  # Child Process
  Process.setsid
  unless chpid = fork
    # To-be orphaned process
    exec('export GEM_HOME=$HOME/.gem/ruby/1.8;export GEM_PATH=$GEM_HOME:/usr/lib/ruby/gems/1.8;cd /home/tricentric/anthonybraxton.org;rackup -s mongrel app/metal/testing.rb &> file_server.log &')
  else
    Process.detach(chpid)
    # End of Child
  end
end

Process.detach(pid)
# End of Parent
