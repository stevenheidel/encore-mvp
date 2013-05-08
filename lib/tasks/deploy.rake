task :deploy do
  `RAILS_ENV=production bundle exec rake assets:precompile`

  `git add public/assets/manifest.yml`
  `git commit -m "Added assets"`
  `git push heroku master`

  `bundle exec rake assets:clean`

  `git checkout public/assets/manifest.yml`
  `git reset --hard HEAD~1`
end