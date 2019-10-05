class MovieTimes::Theater 
  attr_accessor :name, :address
  
  def initialzize(name, address)
    @name = name
    @address = address
    @movies = []
  end
  
  def movies
    @movies
  end
  
end
  