worker_processes 3
timeout 30
preload_app true

before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)

  # required for Sync
  EM.stop if defined?(EM) && EM.reactor_running?
end

after_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end

  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)

  # required for Sync
  Thread.new { EM.run }
end
