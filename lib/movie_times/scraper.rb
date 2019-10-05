class MovieTimes::Scraper
  
  def self.get_page(zipcode)
    #Gets the page of Fandango that corresponds to the users zipcode
    page = Nokogiri::HTML(open("https://www.fandango.com/#{zipcode}_movietimes?mode=general&q=#{zipcode}"))
    binding.pry
  end
  
  
  
end