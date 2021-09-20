set +e

source ~/.bash_profile

cd /var/www/WorkLiveShift
git pull
bundle install --without test development
bundle exec rails assets:precompile RAILS_ENV=production
bundle exec rails db:migrate RAILS_ENV=production
cat tmp/pids/unicorn.pid |xargs kill -9
RAILS_SERVE_STATIC_FILES=1 unicorn_rails -c config/unicorn.rb -E production -D