#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install

# Precompile assets
bundle exec rails assets:precompile

# Clean up old assets
bundle exec rails assets:clean

# Run database migrations
bundle exec rails db:migrate

# Seed the database
bundle exec rails db:seed