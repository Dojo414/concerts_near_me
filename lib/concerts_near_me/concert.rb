class ConcertsNearMe::Concert 
  attr_accessor :date, :acts, :venue, :city, :state, :country, :additional_details
  @@all = []
  
  def initialize(date=nil, acts=nil, venue=nil, city=nil, state=nil, country=nil, additional_details=nil)
    @date = date
    @acts = acts
    @venue = venue
    @city = city
    @state = state
    @country = country
    @additional_details = additional_details
    @@all << self
  end
    
    
  
  
end
  