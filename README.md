# README

### Ruby version

ruby 2.4.1 rails 5.1.7

### Gems included

fast_jsonapi for json serialization

rspec-rails, factory_bot_rails, shoulda-matchers, simplecov for testing

### Setup

clone down repo
run
`bundle install` to install all dependent gems
`rake import` to create database and run migrations, as well as import .csv data into database

`rspec` will run the test suite

`rails s` will start a local server on localhost:3000
