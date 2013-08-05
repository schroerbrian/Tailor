require 'json'
require 'open-uri'

namespace :zappos do
  desc "import yelp data to database"

  task :current_environment do
      puts "You are running rake task in #{Rails.env} environment"
    end

  task :import => :environment do
    result = JSON.parse(open("url_of_json_service").read)



    Latest Styles for San Francisco
