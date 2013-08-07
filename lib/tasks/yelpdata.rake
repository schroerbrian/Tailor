include Yelp::V2::Search::Request
include Yelp::V2::Business::Request
namespace :yelpdata do
  desc "import yelp data to database"

  task :current_environment do
      puts "You are running rake task in #{Rails.env} environment"
    end

  task :import => :environment do
   Tag.all.each { |t|
    Neighborhood.all.each { |n|
        c = Yelp::Client.new
        request = Location.new(
           :term => "#{t.name} bar",
           :city => 'San Francisco',
           :neighborhood => n.name,
           :limit => 1,
           :consumer_key => ENV['YELP_CONSUMER_KEY'],
           :consumer_secret => ENV['YELP_CONSUMER_SECRET'],
           :token => ENV['YELP_TOKEN'],
           :token_secret => ENV['YELP_TOKEN_SECRET'])

           response = c.search(request)

           businesses = response['businesses']
           puts(businesses)

           businesses.each { |biz|
              v = Venue.find_by_name(biz['name'])
              if(v.nil?)
                venue = Venue.new(
                :name => biz['name'],
                :address_1 => biz['location']['address'][0],
                :address_2 => biz['location']['cross_streets'],
                :city => biz['location']['city'],
                :state => biz['location']['state_code'],
                :zip => biz['location']['postal_code'],
                :img_url => biz['image_url'],
                :biz_url => biz['url'],
                :YID => biz['id'],
                :snippet_text => biz['snippet_text'],
                :mobile_url => biz['mobile_url'],
                :neighborhood_name => n.name,
                :closed => biz['is_closed'],
                :rating => biz['rating'])
                venue.save!
                venue.tags << t
                venue.neighborhood = n
                venue.save!
                puts("Created tag #{t.name} in #{venue.name}")
              else
                unless v.tags.include?(t)
                  v.tags << t
                  puts("Added tag #{t.name} in #{v.name}")
                  puts("#{v.name} has the following tags #{v.tags.inspect}")
                end
              end
            }
         }
       }
    end
end
