#!/bin/sh
set -e

bin/bundle check || bin/bundle install

echo "Installing JavaScript dependencies..."
yarn install

echo "Running Rails migrations..."
bin/rails db:migrate

echo "Seeding database..."
bin/rails db:seed

yarn build
yarn build:css

exec bin/rails server -b 0.0.0.0