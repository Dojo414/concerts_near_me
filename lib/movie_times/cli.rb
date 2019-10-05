class MovieTimes::CLI 
  
  def call 
    puts "Hello! Welcome to Movie Times!"
    puts "Please enter your zipcode"
    zipcode = gets_zip
    page = MovieTimes::Scraper.get_page(zipcode)
    binding.pry
  end
  
  def gets_zip
    zipcode = gets.chomp
    zipcode
  end
  
  def gets_theatres
    theatres = ["Tyrone", "Parkside", "Cobb"]
    i = 1
    theatres.each do |theatre|
      puts "#{i}. #{theatre}"
      i += 1
  end
end

def gets_movies
  number = gets.to_i
  case number
    when 1 
      puts "Forrest Gump"
    when 2
      puts "Lego Movie"
    when 3 
      puts "Hello World"
    end
end


  
   
  
  
  
  
end