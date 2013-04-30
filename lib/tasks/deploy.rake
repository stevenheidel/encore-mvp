task :deploy do
  `git push origin master`

  `git push heroku master`
end