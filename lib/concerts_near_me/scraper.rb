class ConcertsNearMe::Scraper
  
  def self.get_page(city,state)
    #Gets the page of SongKick that corresponds to the users city and state
    page = Nokogiri::HTML(open("https://www.songkick.com/search?page=1&per_page=10&query=#{city}%2C+#{state}&type=upcoming"))
  end
  
  def self.get_list(page)
    list = page.css("li.concert.event")
    return list
  end
  
  def self.create_concerts_from_list(list)
    concerts = []
    list.each do |concert|
      date = concert.css("p.date strong").text.strip
      acts = concert.css("p.summary strong").text.strip
      venue = (concert.css("p.location").text.split(","))[0].strip
      city = (concert.css("p.location").text.split(","))[1].strip
      state = (concert.css("p.location").text.split(","))[2].strip
      country = (concert.css("p.location").text.split(","))[3].strip
      new_url = "https://songkick.com/#{concert.css("a.thumb").attribute("href").value}"
      additional_details = gets_additional_details(new_url)
      new_concert = ConcertsNearMe::Concert.new(date, acts, venue, city, state, country, additional_details)
      concerts << new_concert
    end
    concerts
  end
  
  def self.gets_additional_details(url)
    page = Nokogiri::HTML(open(url))
    additional_details = page.css("div.additional-details-container p")
    return additional_details
  end
    

    
    
  
    
  
  
  
end