task :deploy do
  `RAILS_ENV=production bundle exec rake assets:precompile`

  `git add -f public/assets/manifest.yml`
  `git commit --allow-empty -m "Temporary Heroku-only deployment commit"`
  `git push heroku +master`

  `git reset --soft HEAD~1`
  `git reset HEAD -f public/assets/manifest.yml`
end