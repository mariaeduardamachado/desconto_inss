#!/bin/sh

set -e

rm -f /usr/src/app/tmp/pids/server.pid

# RAILS_ENV=development bundle exec rake db:create:all
# RAILS_ENV=development bundle exec rake db:migrate

#RAILS_ENV=development bundle exec sidekiq&

#RAILS_ENV=development bundle exec rdebug-ide --debug --host 0.0.0.0 --port 9090 -- bin/rails server -p 3000 -b 0.0.0.0
# RAILS_ENV=development bundle exec rails server -b 0.0.0.0 -p 3000
sleep infinity
# docker exec -ti  nobe-iss-web bash