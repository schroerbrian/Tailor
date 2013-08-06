# require 'json'
# require 'open-uri'

# namespace :zappos do
#   desc "import yelp data to database"

#   task :current_environment do
#       puts "You are running rake task in #{Rails.env} environment"
#     end

#   task :import => :environment do
#     result = JSON.parse(open("url_of_json_service").read)



# Latest Styles for San Francisco
# http://api.zappos.com/Statistics?type=latestStyles&filters={%22gender%22:%22F%22}&location={%22city%22:%22San%20Francisco%22}&key=27b076f861701c2532e22f21b7b455c545afde4c

# Latest styles for SF female, nike, shoes
# http://api.zappos.com/Statistics?type=latestStyles&filters={%22gender%22:%22F%22,%22brand%22:{%22name%22:%22Nike%22},%22categorization%22:{%22categoryType%22:%22Shoes%22}}&location={%22state%22:%22ca%22,%22city%22:%22San%20Francisco%22}&key=27b076f861701c2532e22f21b7b455c545afde4c
