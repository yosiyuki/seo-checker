worker_processes 2

RAILS_ROOT = File.expand_path("../..", __FILE__)

listen "#{RAILS_ROOT}/tmp/sockets/unicorn.sock"
pid "#{RAILS_ROOT}/tmp/pids/unicorn.pid"

stderr_path "#{RAILS_ROOT}/log/unicorn.log"
stdout_path "#{RAILS_ROOT}/log/unicorn.log"

preload_app true

before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
    if File.exists?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      puts "failed kill old process"
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
