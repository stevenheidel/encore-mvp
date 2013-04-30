task :deploy do
  message = ARGV.last

  `RAILS_ENV=production bundle exec rake assets:precompile`
  `git add public/assets/manifest.yml`
  `git commit -m "#{message}"`

  `git push origin master`
  `git push heroku master`

  `bundle exec rake assets:clean`

  task message.to_sym do ; end # don't try to run another rake task
end