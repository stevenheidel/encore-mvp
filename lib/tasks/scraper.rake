namespace :scraper do 
  task :instagram => :environment do
    unless ENV['CURRENT_CONCERT_ID'].to_i > 0
      puts "Please specify ENV['CURRENT_CONCERT_ID']"
      exit
    end

    # Find the concert
    concert = Concert.find_by_id(ENV['current_concert'].to_i)

    # Set up Instagram
    Instagram.configure do |config|
      config.client_id = "245d5992fc774b1db8d0b93db5c0ffb6"
      #config.client_secret = "4d699ac7f6574a63b2ec5afcf914f4d7"
    end

    images = []

    # Get images from instagram and assign a score
    Instagram.location_search(concert.venue_lat, concert.venue_long).each do |location|
      location_likelihood = string_similarity(location.name, concert.venue)
      if location_likelihood > 0.25
        Instagram.location_recent_media(location.id).each do |media|
          caption_likelihood = string_similarity(media.caption.text, concert.title)
          images << {
            :link => media.link, 
            :image_url => media.images.low_resolution.url, 
            :text => media.caption.text,
            :score => ((location_likelihood * caption_likelihood) * 1000).to_i,
            :user_name => media.caption.from.full_name,
            :user_image_url => media.caption.from.profile_picture
          }
        end
      end
    end
    
    # Insert images into the database
    posts = []
    images.each do |image|
      posts << Post.new(
        :concert_id => concert.id, 
        :link => image[:link], 
        :network => "Instagram", 
        :published => false, 
        :medium => "Photo", 
        :text => image[:text], 
        :image_url => image[:image_url], 
        :filter_score => image[:score],
        :user_name => image[:user_name],
        :user_image_url => image[:user_image_url]
      )
    end
    Post.import posts
  end
end

# http://stackoverflow.com/questions/653157/a-better-similarity-ranking-algorithm-for-variable-length-strings
def string_similarity(str1, str2)
  str1.downcase! 
  pairs1 = (0..str1.length-2).collect {|i| str1[i,2]}.reject {
    |pair| pair.include? " "}
  str2.downcase! 
  pairs2 = (0..str2.length-2).collect {|i| str2[i,2]}.reject {
    |pair| pair.include? " "}
  union = pairs1.size + pairs2.size 
  intersection = 0 
  pairs1.each do |p1| 
    0.upto(pairs2.size-1) do |i| 
      if p1 == pairs2[i] 
        intersection += 1 
        pairs2.slice!(i) 
        break 
      end 
    end 
  end 
  (2.0 * intersection) / union
end